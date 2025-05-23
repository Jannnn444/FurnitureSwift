//
//  NotificationView.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/5/23.
//

import SwiftUI

struct NotificationView: View {
    var noties: [String] = []
    
    var body: some View {
        Text("Here is the notification page")
        ForEach(noties, id: \.self) { n in
            Text(n)
        }
    }
}
