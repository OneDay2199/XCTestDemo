//
//  XCTestDemoTests.swift
//  XCTestDemoTests
//
//  Created by FGZ on 2023/5/16.
//

import XCTest
@testable import XCTestDemo


final class XCTestDemoTests: XCTestCase {
    
    // 本用例全局持有的对象
    var vc: ViewController?

    override func setUp() {
        super.setUp()
        // 初始化对象
        self.vc = ViewController.init()
    }
    
    // 测试对象调用相关方法
    func testVCFibFunc() {
        self.vc?.testFibFunc()
    }
    // 测试对象释放
    override func tearDown() {
        super.tearDown()
        self.vc = nil
    }
    
    func testSimple() {
        // 断言相等
        XCTAssertEqual(1 + 1, 2, "1 + 1 = 2")
        // Bool 值为true时通过 下面两种方式判断一致
        let bookValue: Bool = false
        XCTAssert(!bookValue, "bool值不为true")
        XCTAssertTrue(!bookValue, "bool值不为true")
        
        // 错误异常
//        XCTAssertEqual(1 + 1, 3, "1 + 1 计算错误")
    }
}
