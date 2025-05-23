//
//  CustomNotificationBar.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/5/22.
//

import Foundation
import SwiftUI

struct CustomNotificationBar: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.8)
            HStack(alignment: .top) {
                Text("Yee hi this is new static messages! ")
                    .font(.subheadline.bold())
                    .fontDesign(.serif)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            }
            .padding(.top, 50)
            .padding(.horizontal)
        }
        .frame(height: 100)
    }
}

#Preview {
    CustomNotificationBar()
}
