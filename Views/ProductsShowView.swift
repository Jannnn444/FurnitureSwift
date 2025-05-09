//
//  ProductsShowView.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/5/9.
//

import SwiftUI

struct ProductsShowView: View {
    @EnvironmentObject var cartManager: CartManager
    var column = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: column, spacing: 20) {
                    ForEach(productList, id: \.id) { product in
                        ProductCartView(product: product)
                        
                    }
                }
                .padding()
            }
            .navigationTitle(Text("All Furniture"))
        }
    }
}

#Preview {
    ProductsShowView()
        .environmentObject(CartManager())
}
