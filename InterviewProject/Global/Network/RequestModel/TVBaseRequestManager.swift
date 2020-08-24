//
//  TVBaseRequestManager.swift
//  InterviewProject
//
//  Created by Eric on 2020/8/21.
//  Copyright © 2020 Tortuga Ventures. All rights reserved.
//

import UIKit

typealias FSResponseSuccess = (_ response: Data) -> Void
typealias FSResponseFail = (_ error: String) -> Void

class TVBaseRequestManager: NSObject {

   
    /**
     * 服务器数据请求:Get方式
     *
     * parameter url:    URL地址
     * parameter block:  返回结果集
     */
    static func doGetRequest(url: String,
                           params: [String: Any]?,
                           success: @escaping FSResponseSuccess,
                           error: @escaping FSResponseFail) {
        AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default).responseJSON { (response) in
                            switch response.result {
                            case .success:
                                success(response.data!)
                            case .failure:
                                let statusCode = response.response?.statusCode
                                error("\(statusCode ?? 0)请求失败")
                                debugPrint(response.response as Any)
                            }
        }
    }
    
}
