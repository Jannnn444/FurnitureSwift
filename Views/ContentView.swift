//
//  ContentView.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/4/29.
//
//

import SwiftUI

struct ContentView: View {
    // This line creates and manages the shared CartManager instance
    
    /*
     Best Practice for CartManager
     The best practice (which your code follows) is:

     Create CartManager once using @StateObject in your app's main view (ContentView) ~~
     Pass it down via .environmentObject(cartManager) from ContentView !!
     Access it with @EnvironmentObject in all child views that need it ~~~
     */
    @StateObject var cartManager = CartManager()
    @State var currentTab: Tab = .Home

    init() {
        // Hide "the default iOS tab bar" since we're creating a custom one !!
        UITabBar.appearance().isHidden = true
    }
    
    // Namespace for matched geometry effect animations
    // This allows smooth transitions between different views/states
    @Namespace var animation
    
    var body: some View {
        // Main TabView that handles switching between different tab content
        TabView(selection: $currentTab) {
          
            // Tab content views - currently just placeholder Text views
            // Each view is tagged with its corresponding Tab enum case
            
            HomePageView()
                .environmentObject(cartManager)
            
            Text("Search view")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.Search)
            Text("Notification view")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.Notifications)
            
            CartView()
                .tag(Tab.Cart)
                .environmentObject(cartManager)
            
            Text("Profile view")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.Profile)
        }
        // Custom tab bar overlay at the bottom of the scree
        .overlay(
            HStack(spacing: 0){
                // Create tab buttons for each tab case
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    TabButton(tab: tab)
                }
                .padding(.vertical)
                // COMPLEX PADDING EXPLANATION:
                // This padding adjusts the bottom space for the tab bar based on the device's safe area
                // If device has no bottom safe area (older phones with home button), use 5pt
                // If device has a bottom safe area (newer phones with notch/dynamic island), use (safeArea.bottom - 15)
                // This ensures the tab bar looks good on all device types
                .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15))
                .background(Color.dark)
            }
            ,
            alignment: .bottom
        )
        // Ignore safe area at the bottom to allow the tab bar to extend to the edge of the screen
        // This removes the default separator line that appears at the edge of safe areas
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    // Custom tab button view builder function
    func TabButton(tab: Tab) -> some View {
        // GeometryReader allows us to get the dimensions of the parent view
        GeometryReader{ proxy in
            Button(action: {
                // Animate tab switching with spring animation for a bouncy effect
                withAnimation(.spring()) {
                    currentTab = tab
                }
            }, label: {
                VStack(spacing: 0) {
                    // Tab icon - shows filled version when selected, outline when not
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                        .resizable()
                        .foregroundColor(Color.kLighter)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .frame(maxWidth: .infinity)
                        .background(
                            ZStack {
                                // Conditional appearance for the selected tab
                                if currentTab == tab {
                                    // Blurred circle background effect behind the selected tab icon
                                    MaterialEffect(style: .light)
                                        .clipShape(Circle())
                                        // Animation magic - it matches the geometry between states
                                        // smooth switching tabs
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                    
                                    // Show tab name text only under the selected tab
                                    Text("")    /*tab.Tabname*/
                                        .foregroundStyle(.dark)
                                        .font(.footnote)
                                        .padding(.top, 50)
                                        .padding(.bottom, 0) //10
                                }
                            }
                        )
                        // Make the entire area tappable
                        .contentShape(Rectangle())
                        // Move the selected tab icon up by 15 points for a raised effect
                        // Non-selected tabs remain at y-offset 0
                        .offset(y: currentTab == tab ? -5 : 0)
                }
            })
        }
        .frame(height: 20)
    }
}

#Preview {
    ContentView()
        .environmentObject(CartManager())
}
/*
WHY .environmentObject() in the Preview?
---------------------------------------
1. For the preview to work correctly, we need to inject a CartManager
2. This simulates what happens in the real app where ContentView creates and passes the CartManager
3. Without this, any view using @EnvironmentObject would crash in preview mode
4. This is ONLY needed for preview - in the actual app, ContentView's @StateObject handles this
*/

// Enum defining all possible tabs
enum Tab: String, CaseIterable {
    // Each case uses the SF Symbol name as its raw value
    case Home = "house"
    case Search = "magnifyingglass.circle"
    case Notifications = "bell"
    case Cart = "bag"
    case Profile = "person"
    
    // Computed property to get the display name for each tab
    var Tabname: String {
        switch self {
        case .Home:
            return "Home"
        case .Search:
            return "Search"
        case .Notifications:
            return "Notifications"
        case .Cart:
            return "Cart"
        case .Profile:
            return "Profile"
        }
    }
}

// Extension to get the safe area insets for the current device
extension View {
    func getSafeArea() -> UIEdgeInsets {
        // Get the first connected scene
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero // Return zero insets if no scene is found
        }
        // Get the safe area insets from the first window
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero // Return zero insets if no window is found
        }
        return safeArea
    }
}

// UIViewRepresentable struct to use UIKit's blur effect in SwiftUI
struct MaterialEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style  // Blur effect style (light, dark, etc.)
    
    // Create the UIKit view
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    // Update the view if needed (empty implementation since our view doesn't change)
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        // No updates needed
    }
}


/*
WHY @StateObject?
----------------
1. @StateObject is used to create and manage an ObservableObject (CartManager) instance
2. @StateObject ensures the CartManager is created ONCE and persists for the lifetime of ContentView
3. If we used @State instead, the CartManager would not be properly retained between view updates
4. @StateObject is specifically designed for reference types (classes) that conform to ObservableObject

WHY CartManager needs to be an ObservableObject?
-----------------------------------------------
1. When cart data changes (adding/removing products), we need the UI to update automatically
2. ObservableObject + @Published properties create a reactive system where UI responds to data changes
3. This implements the MVVM pattern (Model-View-ViewModel) where CartManager is the ViewModel

The flow of data works like this:
1. ContentView creates the CartManager with @StateObject
2. ContentView passes the CartManager to child views using .environmentObject(cartManager)
3. Child views like ProductCartView access this shared instance with @EnvironmentObject
4. When any view modifies the cart data, all views using @EnvironmentObject get updated
*/

#Preview {
    ContentView()
}
