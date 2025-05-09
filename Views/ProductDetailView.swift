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
                VStack(alignment: .leading) {
                    ZStack(alignment: .topTrailing) {
                        Image(product.image)
                            .resizable()
                            .frame(height: 300)
                        
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(.top, 65)
                            .padding(.trailing, 20)
                    }.padding(.top, 0)
                 
                    VStack(alignment: .leading) {
                        HStack {
                            Text(product.name)
                                .font(.title2.bold())
                            Spacer()
                            
                            Text("$\(product.price).00")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                                .background(Color.kSecondary)
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
                            .frame(width: .infinity, alignment: .leading)
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text("Colors")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                Text("Blue")
                                    .foregroundStyle(.blue)
                                Text("Black")
                                    .foregroundStyle(.black)
                                Text("Off-white")
                                    .foregroundStyle(.gray)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        .padding(.vertical)
                        PaymentButton(action: {})
                            .frame(width: .infinity, height: 35)
                        }
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                    .offset(y: -30)
                    }
                }
            }
        .ignoresSafeArea(edges: .top)
        .background(Color.white)
    }
}


struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: productList[1])
    }
}
