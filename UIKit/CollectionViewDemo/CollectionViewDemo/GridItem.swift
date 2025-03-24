//
//  File.swift
//  CollectionViewDemo
//
//  Created by 존진 on 3/24/25.
//

import Foundation

struct GridItem: Hashable {
    var id = UUID()
    var title: String
    let imageSystemName: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: GridItem, rhs: GridItem) -> Bool {
        return lhs.id == rhs.id
    }
}
