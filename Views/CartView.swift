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
        NavigationView {
            VStack {
                if cartManager.cartItems.isEmpty {
                    // Empty cart state
                    VStack(spacing: 20) {
                        Image(systemName: "cart")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        
                        Text("Your cart is empty")
                            .font(.title2)
                            .fontDesign(.serif)
                            .foregroundColor(.gray)
                        
                        Text("Add some products to get started!")
                            .font(.subheadline)
                            .fontDesign(.serif)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                } else {
                    List {
                        ForEach(cartManager.cartItems) { cartItem in
                            HStack(spacing: 15) {
                                
                                // PRODUCT IMAGE AND INFO - Tappable area for navigation
                                HStack(spacing: 12) {
                                    
// Product Image when fetching from api
                                    
//                                    AsyncImage(url: URL(string: cartItem.product.image)) { phase in
//                                        switch phase {
//                                        case .success(let image):
//                                            image
//                                                .resizable()
//                                                .aspectRatio(contentMode: .fill)
//                                                .frame(width: 60, height: 60)
//                                                .clipped()
//                                                .cornerRadius(8)
//                                        case .failure(_):
//                                            Image(systemName: "photo")
//                                                .font(.system(size: 24))
//                                                .foregroundColor(.gray)
//                                                .frame(width: 60, height: 60)
//                                                .background(Color.gray.opacity(0.2))
//                                                .cornerRadius(8)
//                                        case .empty:
//                                            ProgressView()
//                                                .frame(width: 60, height: 60)
//                                                .background(Color.gray.opacity(0.2))
//                                                .cornerRadius(8)
//                                        @unknown default:
//                                            EmptyView()
//                                        }
//                                    }
                                    
                                    Image(cartItem.product.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 60, height: 60)
                                        .clipped()
                                        .cornerRadius(8)
                                    
                                    // Product Informatoins
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(cartItem.product.name)
                                            .font(.headline)
                                            .fontDesign(.serif)
                                            .lineLimit(2)
                                        
                                        Text("$\(cartItem.product.price)")
                                            .font(.subheadline)
                                            .fontDesign(.serif)
                                            .foregroundColor(.gray)
                                        
                                        Text("Subtotal: $\(cartItem.totalPrice)")
                                            .font(.caption)
                                            .fontDesign(.serif)
                                            .foregroundColor(.blue)
                                            .fontWeight(.medium)
                                    }
                                    
                                    Spacer()
                                }
                                
                                // NAVIGATION GESTURE - Only on product info area
                                .onTapGesture {
                                    // COMMENTED OUT FOR NOW - Uncomment when ready to add navigation
                                    // Navigate to ProductDetailView(product: cartItem.product)
                                    print("Tapped on product: \(cartItem.product.name)")
                                }
                                // Visual feedback for tappable area
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.clear)
//                                        .contentShape(Rectangle()) // Makes entire area tappable
                                )
                                
                                // QUANTITY CONTROLS - Separate from navigation area
                                VStack(spacing: 8) {
                                    Text("Qty")
                                        .font(.caption2)
                                        .fontDesign(.serif)
                                        .foregroundColor(.gray)
                                    
                                    HStack(spacing: 8) {
                                        // Minus Button
                                        Button(action: {
                                            cartManager.removeFromCart(product: cartItem.product)
                                            print("Minus tapped for: \(cartItem.product.name)")
                                        }) {
                                            Image(systemName: "minus")
                                                .font(.system(size: 12, weight: .bold))
                                                .foregroundColor(.white)
                                                .frame(width: 28, height: 28)
                                                .background(Color.red)
                                                .clipShape(Circle())
                                        }
                                        .buttonStyle(PlainButtonStyle()) // Prevents list row selection
                                        
                                        // Quantity Display
                                        Text("\(cartItem.quantity)")
                                            .fontDesign(.serif)
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .frame(minWidth: 25)
                                        
                                        // Plus Button
                                        Button(action: {
                                            cartManager.addToCart(product: cartItem.product)
                                            print("Plus tapped for: \(cartItem.product.name)")
                                        }) {
                                            Image(systemName: "plus")
                                                .font(.system(size: 12, weight: .bold))
                                                .foregroundColor(.white)
                                                .frame(width: 28, height: 28)
                                                .background(Color.blue)
                                                .clipShape(Circle())
                                        }
                                        .buttonStyle(PlainButtonStyle()) // Prevents list row selection
                                    }
                                }
                            }
                            .padding(.vertical, 8)
                            .swipeActions(edge: .trailing) {
                                Button("Delete") {
                                    withAnimation {
                                        cartManager.removeEntireItem(product: cartItem.product)
                                    }
                                }
                                .tint(.red)
                            }
                        }
                        .onDelete(perform: deleteItems) // Alternative delete method
                    }
                    .listStyle(PlainListStyle())
                    
                    // CART SUMMARY SECTION
                    VStack(spacing: 0) {
                        Divider()
                        
                        // Summary Info
                        VStack(spacing: 12) {
                            HStack {
                                Text("Total Items:")
                                    .font(.subheadline)
                                    .fontDesign(.serif)
                                Spacer()
                                Text("\(cartManager.productsCount)")
                                    .font(.subheadline)
                                    .fontDesign(.serif)
                                    .fontWeight(.semibold)
                            }
                            
                            HStack {
                                Text("Total Amount:")
                                    .font(.title3)
                                    .fontDesign(.serif)
                                    .fontWeight(.medium)
                                Spacer()
                                Text("$\(cartManager.total)")
                                    .font(.title2)
                                    .fontDesign(.serif)
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                        
                        // Checkout Button
                        Button(action: {
                            // Checkout logic here
                            print("Proceeding to checkout...")
                        }) {
                            HStack {
                                Image(systemName: "creditcard")
                                Text("Proceed to Checkout")
                                    .fontDesign(.serif)
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(12)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                        .disabled(cartManager.cartItems.isEmpty)
                    }
                    .background(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -2)
                }
            }
            .navigationTitle("Shopping Cart") 
            .navigationBarTitleDisplayMode(.large)
            
            .toolbar {
                if !cartManager.cartItems.isEmpty {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Clear All") {
                            withAnimation {
                                cartManager.clearAllItems()
                            }
                        }
                        .foregroundColor(.red)
                    }
                }
            }
        }
    }
    
    // MARK: - Helper Functions
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                let cartItem = cartManager.cartItems[index]
                cartManager.removeEntireItem(product: cartItem.product)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    CartView()
        .environmentObject(CartManager())
}
