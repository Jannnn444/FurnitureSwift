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
            description: "Luxurious genuine leather upholstery with plush cushioning for ultimate comfort. Perfect for modern living spaces with its timeless design and durability. Features reinforced stitching and premium foam core that maintains shape after years of use. Includes removable back cushions and easy-clean surface treatment to protect against spills and wear.",
            supplier: "IKEA",
            price: 350,
            width: "200 cm",
            height: "135 cm",
            diameter: "185 cm"
           ),
    Product(name: "Sweet Couch",
            image: "fn2",
            description: "Contemporary design featuring premium fabric and elegant stitching. Ideal for family gatherings with its spacious seating and superior comfort. Constructed with a solid hardwood frame and no-sag spring system for lasting support. Stain-resistant fabric technology makes maintenance effortless while retaining its soft, inviting texture.",
            supplier: "IKEA",
            price: 350,
            width: "210 cm",
            height: "135 cm",
            diameter: "185 cm"
           ),
    Product(name: "Crocodile Couch",
            image: "fn3",
            description: "Distinctive textured upholstery with crocodile pattern detailing. Statement piece that combines unique aesthetics with practical comfort. Engineered with high-resilience foam padding and a specialized texture that's both visually striking and tactilely pleasing. Reinforced with metal legs and precision-crafted joints for stability and longevity.",
            supplier: "Walmart",
            price: 350,
            width: "220 cm",
            height: "135 cm",
            diameter: "185 cm"
           ),
    Product(name: "Good Couch",
            image: "fn4",
            description: "Sleek silhouette with sophisticated lines and premium cushioning. Versatile design that elevates any living space with its attractive profile. Incorporates ergonomic design principles for optimal back support and relaxation. Features hidden storage compartments beneath the cushions, perfect for organizing blankets and accessories.",
            supplier: "IKEA",
            price: 350,
            width: "230 cm",
            height: "135 cm",
            diameter: "185 cm"
           ),
    Product(name: "Dream Couch",
            image: "fn5",
            description: "On-trend design featuring contemporary styling and high-grade materials. The perfect centerpiece for modern interiors with its fashionable appeal. Crafted with eco-friendly materials including sustainably sourced wood frame and low-VOC upholstery. Convertible design allows for multiple seating configurations to adapt to changing entertainment needs.",
            supplier: "IKEA",
            price: 350,
            width: "240 cm",
            height: "135 cm",
            diameter: "185 cm"
           ),
    Product(name: "Niche Couch",
            image: "fn6",
            description: "Innovative design with clean lines and rejuvenating comfort. A unique addition to specialized interior concepts with its distinctive character. Incorporates advanced modular components that can be rearranged to suit different room layouts and occasions. Features integrated USB charging ports discreetly positioned for modern connectivity needs.",
            supplier: "IKEA",
            price: 350,
            width: "250 cm",
            height: "135 cm",
            diameter: "185 cm"
           )
]
