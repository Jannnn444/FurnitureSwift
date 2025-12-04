//
//  ProfileView.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/12/4.
//

// Views/ProfileView.swift

import SwiftUI

struct ProfileView: View {
    @State private var isLoggedIn = false
    @ObservedObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if isLoggedIn {
                    // TODO: You design this part
                    // What should logged-in users see?
                    Text("Welcome Back")
                        .font(.title)
                        .fontDesign(.serif)
                        .foregroundStyle(.gray)
                    Button(action: {
                        // Action
                        
                    }) {
                        Text("Log Out")
                            .padding()
                            .font(.caption)
                            .fontDesign(.serif)
                            .foregroundStyle(.white)
                            .background(Color.gray)
                            .cornerRadius(12)
                    }
                    
                    Button(action: {
                        // Action
                    }) {
                        // UI
                        Text("Link to personal email")
                            .padding()
                            .fontDesign(.serif)
                            .font(.caption)
                            .font(.caption)
                            .foregroundStyle(.white)
                            .background(Color.gray)
                            .cornerRadius(12)
                    }
                    // Shows Personal Datas
                    // Name
                    // email
                    // personal card information?
                    
                } else {
                    // TODO: You design this part
                    // What should logged-out users see?
                    // Include your login button here
                    
                    Text("Hello please login for more personal service")
                        .font(.body)
                        .fontDesign(.serif)
                        .foregroundStyle(.gray)
                    
                    
                    // MARK: Login Button
                    Button(action: {
                        // Login
                      
                    }) {
                        Text("Login Button")
                            .padding()
                            .font(.caption)
                            .fontDesign(.serif)
                            .foregroundStyle(.white)
                            .background(Color.gray)
                            .cornerRadius(12)
                    }
                    
                    // MARK: Sign Up Button
                    Button(action: {
                        // SignUP
                        
                    }) {
                        Text("Sign Up Button")
                            .padding()
                            .font(.caption)
                            .fontDesign(.serif)
                            .foregroundStyle(.white)
                            .background(Color.gray)
                            .cornerRadius(12)
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}

