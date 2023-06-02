//
//  NetworkTool.swift
//  XCTestDemo
//
//  Created by FGZ on 2023/6/1.
//

import Foundation
import Alamofire

class NetworkTool {
    
    typealias SuccessBlock = (_ data: Any?) -> Void
    typealias FailBlock = (_ error: Error) -> Void
    
    class func get(url: String, success: SuccessBlock?, fail: FailBlock?) {
        Alamofire.AF.request(url, method: .get).response { resp in
            switch resp.result {
                case .success(let data):
                    success?(data)
                case .failure(let error):
                    fail?(error)
            }
        }
    }
    
    class func post(url: String, success: SuccessBlock?, fail: FailBlock?) {
        Alamofire.AF.request(url, method: .post).response { resp in
            switch resp.result {
                case .success(let data):
                    success?(data)
                case .failure(let error):
                    fail?(error)
            }
        }
    }
    
    
}
