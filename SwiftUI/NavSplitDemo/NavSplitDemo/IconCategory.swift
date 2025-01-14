//
//  IconCategory.swift
//  NavSplitDemo
//
//  Created by 존진 on 1/14/25.
//

import Foundation

struct IconCategory: Identifiable, Hashable {
    let id = UUID()
    var categoryName: String
    var images: [String]
}
