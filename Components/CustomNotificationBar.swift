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
            Color.gray.opacity(0.5)
            HStack(alignment: .top) {
                Text("Yee hi this is new static messages! ")
                    .font(.headline.bold())
                
            }.frame(width: 200, height: 50, alignment: .leading)
        }.ignoresSafeArea()
    }
}

#Preview {
    CustomNotificationBar()
}
