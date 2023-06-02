//
//  XCTestDemoUITests.swift
//  XCTestDemoUITests
//
//  Created by FGZ on 2023/5/15.
//

import XCTest

final class XCTestDemoUITests: XCTestCase {

    lazy var app: XCUIApplication = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        // 初始化
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        // 根据title 获取按钮
        let btn1 = app.buttons["按钮1"]
        let btn2 = app.buttons["按钮2"]
        let btn3 = app.buttons["按钮3"]
        let btn4 = app.buttons["按钮4"]
        let btn5 = app.buttons["按钮5"]
        let btn6 = app.buttons["按钮6"]
        
        XCTAssertTrue(btn1.exists, "按钮1 不存在")
        XCTAssertTrue(btn2.exists, "按钮2 不存在")
        XCTAssertTrue(btn3.exists, "按钮3 不存在")
        XCTAssertTrue(btn4.exists, "按钮4 不存在")
        XCTAssertTrue(btn5.exists, "按钮5 不存在")
        XCTAssertTrue(btn6.exists, "按钮6 不存在")

        btn1.tap()
        btn2.tap()
        btn3.tap()
        btn4.tap()
        btn5.tap()
        btn6.tap()
    }

    func testPushClick() {
        let btn = app.descendants(matching: .any).matching(identifier: "pushbtn").firstMatch
        XCTAssertTrue(btn.exists, "push 不存在")
        btn.tap()
    }
    
    func testClick() {
        // 根据title 获取按钮
        let btn1 = app.buttons["按钮1"]
        XCTAssertTrue(btn1.exists, "按钮1 不存在")
        btn1.tap()
        
        // 通过标记获取组件  pushvc
        let btn = app.descendants(matching: .any).matching(identifier: "pushbtn").firstMatch
        XCTAssertTrue(btn.exists, "push 不存在")
        btn.tap()
    }
    
    // 通过录制操作生成测试
    func testRecordClick() {
        
        app/*@START_MENU_TOKEN@*/.staticTexts["按钮3"]/*[[".buttons[\"按钮3\"].staticTexts[\"按钮3\"]",".staticTexts[\"按钮3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Push T1VC"]/*[[".buttons[\"Push T1VC\"].staticTexts[\"Push T1VC\"]",".buttons[\"pushbtn\"].staticTexts[\"Push T1VC\"]",".staticTexts[\"Push T1VC\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let table = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .table).element(boundBy: 0)
        table/*@START_MENU_TOKEN@*/.cells.staticTexts["index: ==9"]/*[[".cells.staticTexts[\"index: ==9\"]",".staticTexts[\"index: ==9\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        table.cells.staticTexts["index: ==13"].tap()
        app.navigationBars["XCTestDemo.T1VC"].buttons["Back"].tap()
        
    }
    
    func testRecord() {
        
    }
    
    
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTapplicationLaunchMetric()]) {
//                XCUIapplication().launch()
//            }
//        }
//    }
}
