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
    
    var body: some View {
        NavigationStack {
            VStack {
                if isLoggedIn {
                    // TODO: You design this part
                    // What should logged-in users see?
                    Text("Welcome Back")
                        .font(.largeTitle.bold())
                        .fontDesign(.serif)
                        .foregroundStyle(.gray)
                    
                    // Shows Personal Datas
                    // Name
                    // email
                    // personal card information?
                    
                } else {
                    // TODO: You design this part
                    // What should logged-out users see?
                    // Include your login button here
                    
                    Text("Hello please login for more personal service")
                        .font(.largeTitle.bold())
                        .fontDesign(.serif)
                        .foregroundStyle(.gray)
                    
                    
                    // MARK: Login Button
                    Button(action: {
                        // Login
                        isLoggedIn.toggle()
                    }) {
                        Text("Login Button")
                            .font(.largeTitle.bold())
                            .fontDesign(.serif)
                            .foregroundStyle(.gray)
                    }
                    
                    // MARK: Sign Up Button
                    Button(action: {
                        // SignUP
                    }) {
                        Text("Sign Up Button")
                            .font(.largeTitle.bold())
                            .fontDesign(.serif)
                            .foregroundStyle(.gray)
                    }
                    
                }
            }
            .navigationTitle("Profile")
        }
    }
}

