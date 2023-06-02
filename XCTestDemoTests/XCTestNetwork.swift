//
//  XCTestNetwork.swift
//  XCTestDemoTests
//
//  Created by FGZ on 2023/6/1.
//

import Foundation

import Foundation
import XCTest
@testable import XCTestDemo

class XCTestNetwork: XCTestCase {
    
    func testNeworkTool() {
        // 创建一个期望
        let rq1 = XCTestExpectation(description: "测试GET 接口")
        let rq2 = XCTestExpectation(description: "测试POST 接口")
        // GET接口数据成功的用例
        NetworkTool.get(url: "http://jsonplaceholder.typicode.com/posts") { data in
            // 接口200
            rq1.fulfill()
        } fail: { error in
            // 接口请求错误
            XCTAssertThrowsError("请求错误")
        }
        
        // 测试空地址的用例
        NetworkTool.post(url: "") { data in
            
        } fail: { error in
            
            rq2.fulfill()
        }
// 等待时间设置为10s
        wait(for: [rq1, rq2], timeout: 10)
    }
    
}
