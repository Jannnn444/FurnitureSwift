//
//  ProductDetailView.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/5/9.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack(alignment: .leading) {
                    ZStack(alignment: .topTrailing) {
                        Image(product.image)
                            .resizable()
                            .frame(height: 300)
                        
                        Button(action: {
                            cartManager.toggleLike(for: product.id)
                        }, label: {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(.top, 65)
                                .padding(.trailing, 20)
                                .foregroundColor(cartManager.isLiked(productId: product.id) ? .red : .black)
                        })
                        
                    }.padding(.top, 0)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(product.name)
                                .fontDesign(.serif)
                                .font(.title2.bold())
                            Spacer()
                            
                            Text("$\(product.price).00")
                                .fontDesign(.serif)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                                .background(Color.kSecondary)
                                .cornerRadius(12)
                        }
                        .padding(.vertical)
                        
                        HStack {
                            HStack(spacing: 10) {
                                 ForEach(0..<5) { index in
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.yellow)
                                }
                                
                                
                                Text("(4.5)")
                                    .fontDesign(.serif)
                                    .foregroundStyle(.gray)
                            }
                            .padding(.vertical)
                            
                            Spacer()
                            
                            HStack {
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "minus.square")
                                        .foregroundColor(.kPrimary2)
                                })
                                Text("1")
                                    .fontDesign(.serif)
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "plus.square")
                                        .foregroundColor(.kPrimary2)
                                })
                            }
                        }
                       
                        Text("Description")
                            .font(.title3)
                            .fontDesign(.serif)
                            .fontWeight(.medium)
                        
                        Text(product.description) .fontDesign(.serif)
                     
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("Size")
                                    .font(.system(size: 18))
                                    .fontDesign(.serif)
                                    .fontWeight(.semibold)
                                Text("Height: \(product.height)")
                                    .fontDesign(.serif)
                                    .foregroundStyle(.gray)
                                Text("Width: \(product.width)")
                                    .fontDesign(.serif)
                                    .foregroundStyle(.gray)
                                Text("Diameter: \(product.diameter)")
                                    .fontDesign(.serif)
                                    .foregroundStyle(.gray)
                            }  
                            .frame(width: .infinity, alignment: .leading)
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Text("Colors")
                                    .font(.system(size: 18))
                                    .fontDesign(.serif)
                                    .fontWeight(.semibold)
                                HStack {
                                    ColorDotView(color: .blue)
                                    ColorDotView(color: .black)
                                    ColorDotView(color: .green)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
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
            .environmentObject(CartManager())
    }
}

struct ColorDotView: View {
    var color: Color
    var body: some View {
        color
            .frame(width: 25, height: 25)
            .clipShape(Circle())
    }
}
