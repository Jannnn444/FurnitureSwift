//
//  NotificationView.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/5/23.
//

import SwiftUI

struct NotificationView: View {
    @EnvironmentObject var cartManager: CartManager
    var noties: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                if noties.isEmpty {
                    Spacer()
                    Text("No notifications")
                        .foregroundColor(.gray)
                        .fontDesign(.serif)
                        .font(.title2)
                    Spacer()
                } else {
                    List {
                        ForEach(noties, id: \.self) { notification in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(notification)
                                    .fontDesign(.serif)
                                    .font(.body)
                                Text("Just now")
                                    .font(.caption)
                                    .fontDesign(.serif)
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical, 5)
                        }
                        .onDelete(perform: deleteNotification)
                    }
                }
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                if !noties.isEmpty {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Clear All") {
                            cartManager.clearNotifications()
                        }
                    }
                }
            }
        }
    }
    
    func deleteNotification(at offsets: IndexSet) {
        cartManager.notificationArray.remove(atOffsets: offsets)
        if cartManager.notificationArray.isEmpty {
            cartManager.isHiddenNotification = true
        }
    }
}

