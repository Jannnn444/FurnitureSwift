//
//  AuthManager.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/12/4.
//

import Foundation

class AuthManager: ObservableObject {
    // Published properties that views will react to
    @Published var isLoggedIn: Bool = false
    @Published var currentUser: User?
    @Published var isLoading: Bool = false
    
    // User model (simple version for now)
    struct User: Codable {
        let id: UUID
        let email: String
        let name: String
    }
    
    // Login function (mock for now, will add real API later)
    func login(email: String, password: String) {
        isLoading = true
        
        // Simulate API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // Mock successful login
            self.currentUser = User(
                id: UUID(),
                email: email,
                name: "Test User"
            )
            self.isLoggedIn = true
            self.isLoading = false
        }
    }
    
    // Logout function
    func logout() {
        isLoggedIn = false
        currentUser = nil
    }
    
    // Signup function (mock for now)
    func signup(email: String, password: String, name: String) {
        isLoading = true
        
        // Simulate API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.currentUser = User(
                id: UUID(),
                email: email,
                name: name
            )
            self.isLoggedIn = true
            self.isLoading = false
        }
    }
}
