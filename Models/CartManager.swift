//
//  CartManager.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/4/30.
//

import Foundation

// if anything changed we can know
// ObservableObject allows SwiftUI to monitor this object for changes and update UI automatically
class CartManager: ObservableObject {
    // @Published properties notify observers (views) when their values change
    // private(set) means these properties can only be modified within this class,
    // but can be read from outside the class
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

/* Array Filtering Operation:
 
 products.filter { $0.id != product.id } 
 creates a new array containing ONLY products whose IDs do NOT match the ID of the product being removed
 $0 is a shorthand for "Each item being considered in the filter operation"
 The filter returns a new array with all products EXCEPT the one being removed
 */
