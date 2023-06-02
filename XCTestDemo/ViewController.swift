//
//  ViewController.swift
//  XCTestDemo
//
//  Created by FGZ on 2023/5/15.
//
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        testFib()
    }

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func b1Click(_ sender: Any) {
        titleLabel.text = "111111  点击==="
    }
    
    @IBAction func b2Click(_ sender: Any) {
        titleLabel.text = "22222  点击==="
    }
    
    @IBAction func b3Click(_ sender: Any) {
        titleLabel.text = "33333  点击==="
    }
    
    @IBAction func b4Click(_ sender: Any) {
        titleLabel.text = "44444 点击==="
    }
    @IBAction func b5Click(_ sender: Any) {
        titleLabel.text = "555555  点击==="
    }
    @IBAction func b6Click(_ sender: Any) {
        titleLabel.text = "66666 点击==="
    }
    
    @IBAction func pushBtnClick(_ sender: Any) {
        
        let vc = T1VC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func test01() {
        print("未编写单元测试的方法")
        
    }
    
    // 测试函数
    func testFibFunc() {
        let fib = Fibonacci()
        let value = fib.fib(n: 6)
        print("VC 测试函数调用 fib(n: 6) 结果值为：\(value)")
        let value1 = fib.fib2(n: 10)
        let value2 = fib.fib3(n: 10)
        print("实现1结果：")
    }
    
    func testFib() {
        let fib = Fibonacci()
        let value = fib.fib(n: 10)
        let value1 = fib.fib2(n: 10)
        let value2 = fib.fib3(n: 10)
        print("""
实现1结果：\(value)
实现2结果：\(value1)
实现3结果：\(value2)
""")
    }
    
    deinit {
        print("VC 被释放了")
    }
}

