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
                    AppBar()
                    
                    SearchView()
                    
                    ImageSliderView()
                    
                    HStack {
                        Text("New Arrivals")
                            .font(.title2)
                            .fontWeight(.medium)
                        Spacer()
                        Image(systemName: "circle.grid.2x2.fill")
                            .foregroundColor(.kPrimary)
                    }
                    .padding()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(productList, id: \.id) { product in
                                NavigationLink{
                                    
                                } label: {
                                    ProductCartView(product: product)
                                }
                            }
                        }
                    }
                }
                .padding()
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
    @EnvironmentObject var cartmanager: CartManager
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
                
                NavigationLink(destination: Text("")) {
                    CartButton(numberOfProducts: cartmanager.products.count)
                }
            }
                Text("Find the Most\nLuxurios")
                    .font(.largeTitle.bold())
                
                + Text(" Furniture")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.kPrimary)
        }
            
        }
        .padding()
        .environmentObject(CartManager())
    }
}
