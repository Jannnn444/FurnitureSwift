//
//  HomePage.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/5/6.
//

import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var cartmanager: CartManager
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    VStack(alignment: .leading) {
                        AppBar().padding(.bottom,10)
                        
                        SearchView()
                        ImageSliderView()
                        
                        HStack {
                            Text("New Arrivals")
                                .font(.title2)
                                .fontWeight(.medium)
                            Spacer()
                            
                            NavigationLink(destination: {
                                ProductsShowView()
                            }, label: {
                                Image(systemName: "circle.grid.2x2.fill")
                                    .foregroundColor(.kPrimary2)
                            })
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(productList, id: \.id) { product in
                                    NavigationLink {
                                        ProductDetailView(product: product)
                                    } label: {
                                        ProductCardView(product: product)
                                            .environmentObject(cartmanager) // + press, bag+
                                    }
                                }
                            }
                            .padding(.horizontal)
//                            .padding(.bottom, 20)
                        }
                    }.ignoresSafeArea()
                }
                
                // Notification bar as overlay at the very top
                if !cartmanager.isHiddenNotification {
                    Button(action: {
                        cartmanager.isHiddenNotification = true
                    }) {
                        CustomNotificationBar()
                            .frame(height: 100)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(20)
                            .ignoresSafeArea(.all, edges: .top)
                            .zIndex(999)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    HomePageView()
        .environmentObject(CartManager())
}

struct AppBar: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "location.north.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing)
                    
                    Text("Shanghai, China")
                        .font(.title2)
                        .foregroundStyle(.kLighter)
                    
                    Spacer()
                    
                    Button(action: {
                        cartManager.isHiddenNotification = false
                        let currentTime = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
                        cartManager.addNotification(message: "Data refreshed at \(currentTime)")
                    }) {
                        Image(systemName: "arrow.clockwise")
                }
                    
                    // NavigationLink ---> Navigation destination been set inside the CartView()
                    NavigationLink(destination: CartView()
                        .environmentObject(cartManager)
                    ){
                        CartButton(numberOfProducts: cartManager.cartItems.count)
                    }
                }.padding(.top,40)
                
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Find the Most")
                                .font(.largeTitle.bold())
                                .foregroundStyle(.gray)
                            
                            Text("Luxurios")
                                .font(.largeTitle.bold())
                                .foregroundStyle(.gray)
                            
                            + Text("Furniture")
                                .font(.largeTitle.bold())
                                .foregroundStyle(.kPrimary2)
                        }
                        .lineLimit(nil)
                        Spacer()
                        
 // old place of old refresh data code
                        /*               
                         Button(action: {
                         // refresh -> api
                         // display -> notification
                         
                         cartManager.isHiddenNotification = false
                         let currentTime = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
                         cartManager.addNotification(message: "Data refreshed at \(currentTime)")
                     }) {
                  //     Image(systemName: "arrow.clockwise")
                         Image(systemName: "bell.fill")
                 }
                         */
                      
                    }
                        
                
                }
            }
            .padding()
            .environmentObject(CartManager())
        }
    }
}
