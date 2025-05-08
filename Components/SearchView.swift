//
//  SearchView.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/4/29.
//

import SwiftUI

struct SearchView: View {
    @State private var search: String = ""
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                
                TextField("Search For Furniture", text: $search)
                    .padding()
            }
            .background(Color(.light))
            .cornerRadius(12)
            
            Image(systemName: "camera")
                .padding()
                .foregroundColor(.white)
                .background(Color.gray)
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchView()
}
