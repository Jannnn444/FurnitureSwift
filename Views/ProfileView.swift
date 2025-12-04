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
    
    // for sign in
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    
    // signup
    @State private var passwordConfirming = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                // MARK: Logged in page
                
                if isLoggedIn {
                    // TODO: You design this part
                    // What should logged-in users see?
                    Text("Welcome Back")
                        .font(.title)
                        .fontDesign(.serif)
                        .foregroundStyle(.gray)
                    Button(action: {
                        // Action
                        Task {
                            await authViewModel.signOut()
                        }
                        
                    }) {
                        Text("Sign Out")
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
                    
//                    // MARK: Type account + password
//                    TextField("Email", text: $email)
//                        .textFieldStyle(.roundedBorder)
//                        .frame(width: 300)
//                        .textInputAutocapitalization(.never)
//                        .keyboardType(.emailAddress)
//                    
//                    SecureField("Pasword", text:  $password)
//                        .textFieldStyle(.roundedBorder)
//                        .frame(width: 300)

                    TextField("Username", text: $username)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 300)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.default)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 300)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)  // Changed to .emailAddress
                        .keyboardType(.default).autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 300)
                        .textContentType(.oneTimeCode)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Confirm Password", text: $passwordConfirming)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 300)
                        .textContentType(.oneTimeCode)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                    
                    
                    // MARK: Login Button
                    Button(action: {
                        // Login
                        Task {
                            let result = await authViewModel.signIn(email: email, password: password)
                            if result == true {
                                isLoggedIn = true // true will shows profile
                            }
                        }
                    }) {
                        Text("Sign In Button")
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
                        // oriented to a signUpView
                        Task {
                            let result = await authViewModel.signUp(email: email, username: username, password: password)
                            print(result)
                        }
                        
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

