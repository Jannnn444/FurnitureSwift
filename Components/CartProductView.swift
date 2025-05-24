//
//  CartProductView.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/5/9.
//

import SwiftUI

struct CartProductView: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    var body: some View {
        HStack(spacing: 20) {
            
            
            NavigationLink {
                ProductDetailView(product: product)
            } label: {
                
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70)
                    .cornerRadius(9)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(product.name)
                        .bold()
                        .fontDesign(.serif)
                        .foregroundStyle(.black)
                    
                    Text("\(product.price)")
                        .bold()
                        .fontDesign(.serif)
                        .foregroundStyle(.dark)
                }
                .padding()
                Spacer()
                Image(systemName: "trash")
                    .foregroundColor(.red)
                    .onTapGesture {
                        cartManager.removeFromCart(product: product)
                    }
            }
            .padding(.horizontal)
            .background(Color.light)
            .cornerRadius(12)
            .frame(width: .infinity, alignment: .leading)
            .padding()
        }
    }
}

#Preview {
    CartProductView(product: productList[2])
        .environmentObject(CartManager())
}
