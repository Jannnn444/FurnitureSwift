//
//  StarRatingView.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/5/24.
//

import SwiftUI

struct StarRatingView: View {
    var product: Product
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        let starArray = cartManager.starsCheck(ratings: product.ratings)
        let averageRating = cartManager.seperateRatings(ratings: product.ratings)
        ForEach(0..<starArray.count,id: \.self) { index in
            Image(systemName: starArray[index] == 0 ? "star.fill" : "star.half.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.yellow)
        }
        Text("(\(String(format: "%.1f", averageRating)))")
            .fontDesign(.serif)
            .foregroundStyle(.gray)
    }
}
