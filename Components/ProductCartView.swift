//
//  ProductCartView.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/4/29.
//

import SwiftUI

struct ProductCartView: View {
    @EnvironmentObject var cartManager: CartManager
    var product : Product
    /*
     @EnvironmentObject allows this view to access a shared instance of CartManager
     that was placed higher up in the view hierarchy (typically in thr main ContentView)
     This creates a dependency injection system where:
     1. we dont need to pass the CartManager directly to each view
     2. all views can access and modify the same shared cart data
     2. When the cartManager publish changes, all views using it will update automatically
     */
    
    var body: some View {
        ZStack {
//            Color(.kSecondary)
            Color(.black)
                
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading ) {
                    Image(product.image)
                        .resizable()
                        .frame(width: 175, height: 160)
                        .cornerRadius(12)
                    
                    Text(product.name)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(.vertical, 1)
                    
                    Text(product.supplier)
                        .foregroundStyle(.light)
                        .font(.caption)
                        .padding(.vertical, 0.5)
                    
                    Text("$ \(product.price)")
                        .bold()
                        .foregroundStyle(.white)
                }.padding(.top, -10)
                    Button(action: {
                        cartManager.addToCart(product: product)
                        // This button would likely call cartManager.addToCart() in a real implementation
                        // Since all views share the same cartManager object, any changes made here
                        // would be visible to all other views using this EnvironmentObject
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 35, height: 35)
                            .padding(.trailing)
                    })
                
            }
        }
        .frame(width: 185, height: 260) //blue area
        .cornerRadius(15)
    }
}

// table tooo high is a majpor big prob
// so when the time is not alright
// For the preview to work, we must provide a CartManager
// This creates a temporary CartManager just for the preview
// In the real app, this would be provided by a parent view

#Preview {
    ProductCartView(product: productList[0])
        .environmentObject(CartManager())
}

// save this balck theme
