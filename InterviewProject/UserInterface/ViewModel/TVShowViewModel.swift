//
//  TVShowViewModel.swift
//  InterviewProject
//
//  Created by Eric on 2020/8/21.
//  Copyright © 2020 Tortuga Ventures. All rights reserved.
//

import UIKit

class TVShowViewModel: NSObject {
    
    override init() {
        super.init()
    }
    
    /**
    *  获取第一次数据响应
    *  @creator     Eric
    */
    let getFirstInfoProducer = SignalProducer<(date: String?, messageModel: TVMessageModel?), Error> { (observer, _) in
        
        let messageInfo = TVDataManager.sharedInstance.getOneNewDataFromDB()
        if messageInfo.date != nil {
            observer.send(value: (messageInfo.date, messageInfo.messageModel))
            observer.sendCompleted()
        } else {
            TVGitHubRequestService.getGitHubInfo(success: { (response) in
                do {
                    let newMessageModel = try JSONDecoder().decode(TVMessageModel.self, from: response)
                    
                    let formatter = DateFormatter()
                    formatter.locale = Locale.init(identifier: "zh_CN")
                    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    let date = formatter.string(from: Date())
                    
                    TVDataManager.sharedInstance.saveData(withModel: newMessageModel, date: date)
                    
                    observer.send(value: (date, newMessageModel))
                    observer.sendCompleted()
                } catch let error {
                    print(error)
                }
            }) { (errorString) in
                print(errorString)
            }
        }
        
    }
    
}
