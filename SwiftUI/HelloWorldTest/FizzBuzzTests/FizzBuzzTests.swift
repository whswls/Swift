//
//  FizzBuzzTests.swift
//  FizzBuzzTests
//
//  Created by 존진 on 4/14/25.
//

import XCTest

// 모듈이 테스트 가능하도록 @testable 추가
@testable import HelloWorldTest

final class FizzBuzzTests: XCTestCase {
    // 제일 처음 호출
    override func setUpWithError() throws {
        print("setUpWithError")
    }
    
    // 제일 마지막 호출
    override func tearDownWithError() throws {
        print("tearDownWithError")
    }

    func testFizzBuzzDivisibleBy3() throws {
        let result = fizzBuzz(3)
        XCTAssertEqual(result, "Fizz")
    }

    func testFizzBuzzDivisibleBy5() throws {
        let result = fizzBuzz(5)
        XCTAssertEqual(result, "Buzz")
    }
    
    func testFizzBuzzDivisibleBy15() throws {
        let result = fizzBuzz(15)
        XCTAssertEqual(result, "Fizz-Buzz")
    }
    
    func testFizzBuzzNotDivisibaleBy30r5ReturnInput() throws {
        let result = fizzBuzz(7)
        XCTAssertEqual(result, "7")
    }
    
    func testAsyncSum() async throws {
        await asyncSum(a: 3, b: 5) {
            result in
            XCTAssertEqual(result, 8)
        }
    }
}

