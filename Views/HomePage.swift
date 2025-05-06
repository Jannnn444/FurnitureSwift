//
//  HomePage.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/5/6.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject var cartmanager: CartManager
    var body: some View {
        
        ZStack(alignment: .top) {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(alignment: .leading) {
                    NavigationStack {
                    HStack{
                        Image(systemName: "location.north.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.trailing)
                        Text("Shanghai, China")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        Spacer()
                        
                        NavigationLink(destination: Text("")) {
                            CartButton(numberOfProducts: cartmanager.products.count)
                        }
                    }
                 }
                }
            }
        }
    
    }
}

#Preview {
    HomePage()
}
