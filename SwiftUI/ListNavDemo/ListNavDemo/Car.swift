//
//  Car.swift
//  ListNavDemo
//
//  Created by 존진 on 1/14/25.
//

import SwiftUI

struct Car: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var imageName: String
    var isHybrid: Bool
}
