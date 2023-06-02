//
//  Fibonacci.swift
//  XCTestDemo
//
//  Created by FGZ on 2023/5/30.
//

import Foundation

class Fibonacci {
    // 方法1
    func fib(n: UInt) -> UInt {
        if n == 0 {
            return n
        }
        var last :UInt = 0, next :UInt = 1
        for _ in 1..<n {
            (last, next) = (next, next + last)
         }
        return next
    }
    // 方法2
    func fib2(n:UInt) -> UInt {
        if n < 2 {
            return n
        }
        return fib2(n: n - 1) + fib2(n: n - 2)
    }
    
    // 方法3
    var fibMemo : [UInt : UInt] = [0:0, 1:1]
    func fib3(n:UInt) -> UInt {
        if let result = fibMemo[n] {
            return result
        } else {
            fibMemo[n] = fib3(n: n - 1) + fib3(n: n - 2)
        }
        return fibMemo[n]!
    }
    
}
