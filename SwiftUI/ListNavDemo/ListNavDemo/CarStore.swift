//
//  CarStore.swift
//  ListNavDemo
//
//  Created by 존진 on 1/14/25.
//

import SwiftUI

// 앱에서 데이터 사용할 수 있게 데이터 저장소 구조체를 추가.
@Observable
class CarStore {
    // Car 객체 배열 형식의 프로퍼티(cars)를 가짐
    var cars: [Car]
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
