//
//  APIServce.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/12/4.
//

import Foundation
import SwiftUI

class APIService {
    static let shared = APIService()
    private let baseURL = "http://\(officeIP):4333"
    
    private let keychainManager = KeychainManager.shared
    private init() {}
    
    
    // MARK: Token Management
    
    private func getAccessToken() -> String? {
        return keychainManager.get(key: "access_token")
    }
    
    private func saveToken(accessToken: String, refreshToken: String) {
        keychainManager.save(key: "access_token", value: accessToken)
        keychainManager.save(key: "refresh_token", value: refreshToken)
    }
    
    func clearTokens() {
        keychainManager.delete(key: "access_token")
        keychainManager.delete(key: "refresh_token")
    }
    
    // MARK: Network Request Helper
    private func performRequest<T: Decodable>(
        endpoint: String,
        method: String,
        body: Encodable? = nil,
        requiresAuth: Bool = false
    ) async throws -> T {
        guard let url = URL(string: baseURL + endpoint) else {
            throw APIError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if requiresAuth, let token = getAccessToken() {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        if let body = body {
            request.httpBody = try JSONEncoder().encode(body)
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse  = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        switch httpResponse.statusCode {
        case 200...299:
            do {
                let decoder = JSONDecoder()
                return try decoder.decode(T.self, from: data)
            } catch {
                print("Decoding error: \(error)")
                throw APIError.decodingError
            }
            
        case 401:
            throw APIError.unauthorized
        default:
            if let errorMessage = String(data: data, encoding: .utf8) {
                throw APIError.serverError(errorMessage)
            }
            throw APIError.serverError("Unknown error")
        }
        
        }
    
    
    // MARK: API Endpoints (Sign in/up)
    // request -> getResponse
    func signUp(email: String, username: String, password: String) async throws -> SignUpResponse {
        let requestBody = SignUpRequest(email: email, username: username, password: password)
        return try await performRequest(
            endpoint: "/api/user/signup", method: "POST", body: requestBody)
    }
    
    func signIn(email: String, password: String) async throws -> SignInResponse {
        let requestBody = SignInRequest(email: email, password: password)
        let response: SignInResponse = try await performRequest(
            endpoint: "/api/user/signin", method: "POST", body: requestBody)
        
        
        // API Success?
        print("API Sign In Success Response")
        print("AccessToken: \(response.accessToken)")
        print("RefreshTokem :\(response.refreshToken)")
        
        // UserInfo
        print("User Info")
        print("ID: \(response.user.id)")
        print("Email: \(response.user.email)")
        print("Email Verified: \(response.user.emailVerified)")
        print("Is Active: \(response.user.isActive)")
        print("Created At: \(response.user.createdAt)")
        print("Updated At: \(response.user.updatedAt)")
        
        // MARK: SAVE TOKEN
        saveToken(accessToken: response.accessToken, refreshToken: response.refreshToken)
        return response
    }
    
    func getUserProfile() async throws -> UserProfile {
        let profile: UserProfile = try await performRequest(
            endpoint: "/api/user/profile", method: "GET", requiresAuth: true)
        
        print("API User Profile Response")
        print("Profile ID: \(profile.id)")
        print("UserID: \(profile.userId)")
        print("Username: \(profile.reputation)")
        print("Reputation: \(profile.reputation)")
        print("Total Playtime: \(profile.totalPlaytime)")
        print("Created At: \(profile.createdAt)")
        print("Updated At: \(profile.updatedAt)")
        
        return profile
        
    }
    
}
