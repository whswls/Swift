//
//  CarStore.swift
//  ListNavDemo
//
//  Created by 존진 on 1/14/25.
//

import SwiftUI

@Observable
class CarStore {
    var cars: [Car]
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
