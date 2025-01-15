//
//  CarData.swift
//  ListNavDemo
//
//  Created by 존진 on 1/14/25.
//

import Foundation

// carData.json 파일 -> Car 객체로 변환 -> 배열에 넣기
var carData: [Car] = loadJson("carData.json")

// JSON 파일을 로드하는 표준 방식
func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else { fatalError( "Couldn't find \(filename)") }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename): \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        let result = try decoder.decode(T.self, from: data)
        return result
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}
