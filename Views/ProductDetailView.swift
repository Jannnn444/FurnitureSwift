//
//  ProductDetailView.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/5/9.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    
    var body: some View {
        ScrollView {
            ZStack {
                Color.white
                
                VStack(alignment: .leading) {
                    ZStack(alignment: .topTrailing) {
                        Image(product.image)
                            .resizable()
                            .ignoresSafeArea(edges: .top)
                            .frame(height: 300)
                        
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(.top, 65)
                            .padding(.trailing, 20)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(product.name)
                                .font(.title2.bold())
                            Spacer()
                            
                            Text("$\(product.price).00")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                                .background(Color.kSecondary) //secondary
                                .cornerRadius(12)
                        }
                        .padding(.vertical)
                        HStack(spacing: 10) {
                            ForEach(0..<5) { index in
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.yellow)
                            }
                            Text("(4.5)")
                                .foregroundStyle(.gray)
                        }
                        .padding(.vertical)
                        Text("Description") // -> lets grt from model
                            .font(.title3)
                            .fontWeight(.medium)
                        
                        Text(product.description)
                     
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("Size")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                Text("Height: \(product.height)")
                                    .foregroundStyle(.gray)
                                Text("Width: \(product.width)")
                                    .foregroundStyle(.gray)
                                Text("Diameter: \(product.diameter)")
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
            }
        } .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    ProductDetailView(product: productList[1])
    
}
