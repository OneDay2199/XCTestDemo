//
//  XCTestFibonacci.swift
//  XCTestDemoTests
//
//  Created by FGZ on 2023/5/30.
//

import Foundation
import XCTest
@testable import XCTestDemo

class XCTestFibonacci: XCTestCase {
    func testFib() {
        let fibObj = Fibonacci()
        XCTAssert(fibObj.fib(n: 8) == 21, "测试第8位斐波那契数 是21")
//        XCTAssert(fibObj.fib(n: 0) == 0, "测试边界0异常")
    }
    
    let numIndex: UInt = 35
    func testFibFunc1Time() {
        // 测试1实现
        print("=== 测试实现1")
        self.measure {
            let fibObj = Fibonacci()
            _ = fibObj.fib(n: numIndex)
        }
    }
    func testFibFunc2Time() {
        // 测试2实现
        print("=== 测试实现2")
        self.measure {
            let fibObj = Fibonacci()
            _ = fibObj.fib2(n: numIndex)
        }
    }
    func testFibFun3Time() {
        // 测试3实现
        print("=== 测试实现3")
        self.measure {
            let fibObj = Fibonacci()
            _ = fibObj.fib3(n: numIndex)
        }
    }
    
}

