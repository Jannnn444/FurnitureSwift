//
//  CartButton.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/5/6.
//

import SwiftUI

struct CartButton: View {
    var numberOfProducts: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "bag.fill")
                .padding(5)
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption2)
                    .fontDesign(.serif)
                    .foregroundStyle(.white)
                    .frame(width: 15, height: 15)
                    .background(Color.green)
                    .cornerRadius(50)
            }
        }
    }
}

#Preview {
    CartButton(numberOfProducts: 1)
}
