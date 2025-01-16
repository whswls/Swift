//
//  Product.swift
//  SwiftDataDemo
//
//  Created by 존진 on 1/16/25.
//

import Foundation
import SwiftData

@Model
final class Product {
    var name: String?
    var quantity: String?
    
    init(name: String, quantity: String) {
        self.name = name
        self.quantity = quantity
    }
}
