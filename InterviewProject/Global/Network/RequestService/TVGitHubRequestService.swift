//
//  TVGitHubRequestService.swift
//  InterviewProject
//
//  Created by Eric on 2020/8/21.
//  Copyright © 2020 Tortuga Ventures. All rights reserved.
//

import UIKit

class TVGitHubRequestService: NSObject {

    /**
    * 获取数据
    *
    * parameter success:    成功
    * parameter error:      失败
    */
    class func getGitHubInfo(success: @escaping FSResponseSuccess,
    error: @escaping FSResponseFail) {
        let params = [String : String]()
        return TVBaseRequestManager.doGetRequest(url: TVRequestUrl.BASEURL, params: params, success: success, error: error)
    }
    
}
