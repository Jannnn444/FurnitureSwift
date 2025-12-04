//
//  AuthViewModel.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/12/4.
//

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var succeedSignUpMessage: String?
    @Published var succeedSignInMessage: String?
    @Published var isAuthenticated = false
    @Published var currentUser: User?
    @Published var userProfile: UserProfile?
    @Published var isUsageItem: Bool = false
    
    private let apiService = APIService.shared
    
    @MainActor
    func signUp(email: String, username: String, password: String) async -> String {
        isLoading = true
        errorMessage = nil
        succeedSignUpMessage = nil
        
        do {
          let response = try await signUp(email: email, username: username, password: password)
            print("\(response)")
            isLoading = false
            succeedSignUpMessage = "Sign up succeeded"
            return String("Sign up suceed!")
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
            return String("Sign up failed")
        }
    }
    
    @MainActor
    func signIn(email: String, password: String) async -> Bool {
        isLoading = true
        errorMessage = nil
        succeedSignInMessage = nil
        
        do {
            let response = try await apiService.signIn(email: email, password: password)
            
            currentUser = response.user
            isAuthenticated = true
            
            print("Login Data Succeeded")
            // token
            print("Access Token: \(response.accessToken)")
            print("Refresh Token: \(response.refreshToken)")
            
            // user infos
            print("User id: \(response.user.id)")
            print("User email: \(response.user.email)")
            print("Email verified: \(response.user.emailVerified)")
            
            
            // MARK: Fetch Date after login success
            await self.fetchUserProfile()
            isLoading = false
            succeedSignInMessage = "Signin succeeded"
            return true
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
            return false
        }
    }
    
    @MainActor
    func fetchUserProfile() async {
        isLoading = true
        errorMessage = nil
        
        do {
            userProfile = try await apiService.getUserProfile()
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
    
    @MainActor
    func signOut() -> String {
        apiService.clearTokens()
        isAuthenticated = false
        
        currentUser = nil
        userProfile = nil
        return String("Sign out succeed")
    }
    
    
}
