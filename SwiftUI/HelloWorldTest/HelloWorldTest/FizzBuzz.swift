//
//  FizzBuzz.swift
//  HelloWorldTest
//
//  Created by 존진 on 4/14/25.
//

public func fizzBuzz(_ number: Int) -> String {
    if number % 3 == 0 && number % 5 == 0 {
        return "fizz-buzz"
    }
    if number % 3 == 0 {
        return "fizz"
    }
    if number % 5 == 0 {
        return "buzz"
    }
    return "\(number)"
}
