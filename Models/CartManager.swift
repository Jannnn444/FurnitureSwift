//
//  CartManager.swift
//  FurnitureSwift
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    @Published private(set) var likedProducts: Set<UUID> = []
    @Published var isHiddenNotification: Bool = true
    @Published var notificationArray: [String] = [] // Fixed name and type
    
    func addToCart(product: Product) {
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
    
    func toggleLike(for productId: UUID) {
        if likedProducts.contains(productId) {
            likedProducts.remove(productId)
        } else {
            likedProducts.insert(productId)
        }
    }
    
    func isLiked(productId: UUID) -> Bool {
        return likedProducts.contains(productId)
    }
    
    // NEW: Add notification
    func addNotification(message: String) {
        notificationArray.insert(message, at: 0) // Add to beginning of array
        isHiddenNotification = false // show the notification
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isHiddenNotification = true
        }
    }
    
    // NEW: Clear all notifications
    func clearNotifications() {
        notificationArray.removeAll()
        isHiddenNotification = true
    }
}
