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
                                .foregroundColor(.kPrimary)
                        })
                    }
                    .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(productList, id: \.id) { product in
                                NavigationLink{
                                    // inside the navigation UI
//                                    Text(product.name)
                                    ProductDetailView(product: product)
                                } label: {
                                    ProductCartView(product: product)
                                        .environmentObject(cartmanager) // + press, bag+
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                    }
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
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    // NavigationLink ---> Navigation destination been set inside the CartView()
                    NavigationLink(destination: CartView()
                        .environmentObject(cartManager)
                    ){
                        CartButton(numberOfProducts: cartManager.products.count)
                    }
                    
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("Find the Most")
                        .font(.largeTitle.bold())
                    
                    Text("Luxurios")
                        .font(.largeTitle.bold())
                    
                    + Text("Furniture")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.dark)
                }
                .lineLimit(nil)
            }
            .padding()
            .environmentObject(CartManager())
        }
    }
}
