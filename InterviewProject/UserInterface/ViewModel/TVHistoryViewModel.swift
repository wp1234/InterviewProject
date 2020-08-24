//
//  TVHistoryViewModel.swift
//  InterviewProject
//
//  Created by Eric on 2020/8/24.
//  Copyright © 2020 Tortuga Ventures. All rights reserved.
//

import UIKit

class TVHistoryViewModel: NSObject {

    let (dataSig, dataObr) = Signal<[(date: String?, messageModel: TVMessageModel?)], Error>.pipe()
    
    override init() {
        super.init()
    }
    
    /**
    *  刷新数据
    *  @creator     Eric
    */
    func getGitHubData(page: Int, refreshType: RefreshType) {
        let dataArr = TVDataManager.sharedInstance.getDataFromDB(withPage: page, size: 20)
        self.dataObr.send(value: dataArr)
    }
}
