//
//  Product.swift
//  FurnitureSwift
//
//  Created by Hualiteq International on 2025/4/29.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var description: String
    var supplier : String
    var price: Int
    var width: String
    var height: String
    var diameter: String
}

var productList = [
        Product(name: "Leather Couch",
                image: "fn1",
                description: "Soft and Comfy",
                supplier: "IKEA",
                price: 350,
                width: "200 cm",
                height: "135 cm",
                diameter: "185 cm"
               ),
        Product(name: "Sweet Couch",
                image: "fn2",
                description: "Excellent",
                supplier: "IKEA",
                price: 350,
                width: "210 cm",
                height: "135 cm",
                diameter: "185 cm"
               ),
        Product(name: "Crocodile Couch",
                image: "fn3",
                description: "Neat",
                supplier: "Walmart",
                price: 350,
                width: "220 cm",
                height: "135 cm",
                diameter: "185 cm"
               ),
        Product(name: "Good Couch",
                image: "fn4",
                description: "Sexy",
                supplier: "IKEA",
                price: 350,
                width: "230 cm",
                height: "135 cm",
                diameter: "185 cm"
               ),
        Product(name: "Dream Couch",
                image: "fn5",
                description: "Hot and trendy",
                supplier: "IKEA",
                price: 350,
                width: "240 cm",
                height: "135 cm",
                diameter: "185 cm"
               ),
        Product(name: "Niche Couch",
                image: "fn6",
                description: "Fresh",
                supplier: "IKEA",
                price: 350,
                width: "250 cm",
                height: "135 cm",
                diameter: "185 cm"
               )
]
