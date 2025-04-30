//
//  CartManager.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/4/30.
//

import Foundation

// if anything changed we can know
class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
    func addToCart(product: Product) {
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
}
