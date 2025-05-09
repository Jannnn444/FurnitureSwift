//
//  CartView.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/5/9.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        ScrollView {
            if cartManager.products.count > 0 {
                ForEach(cartManager.products, id: \.id) { product in
                CartProductView(product: product)
                        .padding(.top, -10)
                        .padding(.bottom, -10)
                }
                HStack {
                    Text("Your Total is ")
                    Spacer()
                    Text("$\(cartManager.total).00")
                        .bold()
                    
                }
                .padding()
                PaymentButton(action: {})
                    .padding()
            } else {
                
                Text("Your cart is empty")
            }
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}
