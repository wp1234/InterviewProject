//
//  TVMessageManager.swift
//  InterviewProject
//
//  Created by Eric on 2020/8/24.
//  Copyright © 2020 Tortuga Ventures. All rights reserved.
//

import UIKit

class TVMessageManager: NSObject {

    // MARK: - 单例
    static let sharedInstance = TVMessageManager()
    
    // MARK: - 数据
    var timer: Timer?
    let (newDataSig, newDataObr) = Signal<(date: String?, messageModel: TVMessageModel?), Error>.pipe()
    
    // MARK: - 初始化方法
    override init() {
        super.init()
        self.timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .default)
    }
    

    //    启动计时器
    func startTimer()  {
        self.timer!.fire()
    }
    
    // MARK: - Action
//    时间相应事件
    @objc func timerAction() {
        TVGitHubRequestService.getGitHubInfo(success: { (response) in
            do {
                let messageModel = try JSONDecoder().decode(TVMessageModel.self, from: response)
                
                let formatter = DateFormatter()
                formatter.locale = Locale.init(identifier: "zh_CN")
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let date = formatter.string(from: Date())
                
                TVDataManager.sharedInstance.saveData(withModel: messageModel, date: date)
                self.newDataObr.send(value: (date, messageModel))
            } catch let error {
                print(error)
            }
        }) { (errorString) in
            print(errorString)
        }
    }
}
