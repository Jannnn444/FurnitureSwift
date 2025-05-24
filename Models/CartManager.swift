//
//  CartManager.swift
//  FurnitureSwift
//

import Foundation

struct CartItem: Identifiable {
    // New CartItem struct to handle product quantities
    let id = UUID()
    let product: Product
    var quantity: Int
    var totalPrice: Int {
        return product.price * quantity
    }
}

class CartManager: ObservableObject {
    @Published var cartItems: [CartItem] = []
    @Published private(set) var total: Int = 0
    @Published private(set) var likedProducts: Set<UUID> = []
    @Published var isHiddenNotification: Bool = true
    @Published var notificationArray: [String] = []
    
    var productsCount: Int {
        return cartItems.reduce(0) { $0 + $1.quantity}
    }
    
    func addToCart(product: Product) {
        if let index = cartItems.firstIndex(where: {$0.product.id == product.id}) {
            // Product already exists, increase quantity
            cartItems[index].quantity += 1
        } else {
            // New product, add to cart
            cartItems.append(CartItem(product: product, quantity: 1))
        }
        updateTotal()
    }
    
    func removeFromCart(product: Product) {
            if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
                if cartItems[index].quantity > 1 {
                    // Decrease quantity by 1
                    cartItems[index].quantity -= 1
                } else {
                    // Remove item completely if quantity is 1
                    cartItems.remove(at: index)
                }
            }
            updateTotal()
        }
        
        // NEW: Remove entire item regardless of quantity
        func removeEntireItem(product: Product) {
            cartItems.removeAll { $0.product.id == product.id }
            updateTotal()
        }
        
        // NEW: Update quantity directly
        func updateQuantity(for product: Product, quantity: Int) {
            if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
                if quantity <= 0 {
                    cartItems.remove(at: index)
                } else {
                    cartItems[index].quantity = quantity
                }
            }
            updateTotal()
        }
        
        private func updateTotal() {
            total = cartItems.reduce(0) { $0 + $1.totalPrice }
        }
        
        // Rest of your functions...
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
        
        func addNotification(message: String) {
            notificationArray.insert(message, at: 0)   //🌟
            isHiddenNotification = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isHiddenNotification = true
            /* Here after jump the notification it hidden after 1s */
            }
        }
        
        func clearNotifications() {
            notificationArray.removeAll() //🌟
            isHiddenNotification = true
        }
    
    func clearAllItems() {
        cartItems.removeAll()
        updateTotal()
    }
    
    }
