//
//  ContentView.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/4/29.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Tab = .Home

    init() {
        UITabBar.appearance().isHidden = true  // hide the bar
    }
    
    @Namespace var animation
    
    var body: some View {
        TabView(selection: $currentTab) {
          
            Text("Home view")
            Text("Search view")
            Text("Notification view")
            Text("Cart view")
            Text("Profile view")
        }
    }
}

#Preview {
    ContentView()
}


enum Tab: String, CaseIterable {
    case Home = "house"
    case Search = "magnifyingglass.circle"
    case Notifications = "bell"
    case Cart = "bag"
    case Profile = "person"
    
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


extension View {
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as?
                UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
}

struct MaterialEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style  // will declare on top
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        <#code#>
    }
}
