//
//  TVShowInfoCell.swift
//  InterviewProject
//
//  Created by Eric on 2020/8/24.
//  Copyright © 2020 Tortuga Ventures. All rights reserved.
//

import UIKit



class TVShowInfoCell: UITableViewCell {

    static let kShowInfoCell = "TVShowInfoCellID"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    
    /**
    *  数据填充：解析详情
    *  @creator    Eric
    *
    *  @param      title            标题信息
    *  @param      value            数据信息
    */
    
    func fillCell(withModel model: TVMessageModel, indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            self.titleLabel.text = "当前用户链接"
            self.valueLabel.text = model.currentUserUrl
            
        case 1:
            self.titleLabel.text = "当前用户授权网络链接"
            self.valueLabel.text = model.currentUserAuthorizationsHtmlUrl
            
        case 2:
            self.titleLabel.text = "授权链接"
            self.valueLabel.text = model.authorizationsUrl
            
        case 3:
            self.titleLabel.text = "代码查询链接"
            self.valueLabel.text = model.codeSearchUrl
            
        case 4:
            self.titleLabel.text = "提交查询链接"
            self.valueLabel.text = model.commitSearchUrl
            
        case 5:
            self.titleLabel.text = "电子邮件链接"
            self.valueLabel.text = model.emailsUrl
            
        case 6:
            self.titleLabel.text = "表情符号链接"
            self.valueLabel.text = model.emojisUrl
            
        case 7:
            self.titleLabel.text = "项目链接"
            self.valueLabel.text = model.eventsUrl
            
        case 8:
            self.titleLabel.text = "提供链接"
            self.valueLabel.text = model.feedsUrl
            
        case 9:
            self.titleLabel.text = "跟随者链接"
            self.valueLabel.text = model.followersUrl
            
        case 10:
            self.titleLabel.text = "跟随链接"
            self.valueLabel.text = model.followingUrl
            
        case 11:
            self.titleLabel.text = "凭证链接"
            self.valueLabel.text = model.gistsUrl
            
        case 12:
            self.titleLabel.text = "中心链接"
            self.valueLabel.text = model.hubUrl
            
        case 13:
            self.titleLabel.text = "问题查询链接"
            self.valueLabel.text = model.issueSearchUrl
            
        case 14:
            self.titleLabel.text = "问题链接"
            self.valueLabel.text = model.issuesUrl
            
        case 15:
            self.titleLabel.text = "键值链接"
            self.valueLabel.text = model.keysUrl
            
        case 16:
            self.titleLabel.text = "标签查询链接"
            self.valueLabel.text = model.labelSearchUrl
            
        case 17:
            self.titleLabel.text = "通知链接"
            self.valueLabel.text = model.notificationsUrl
            
        case 18:
            self.titleLabel.text = "组织链接"
            self.valueLabel.text = model.organizationUrl
            
        case 19:
            self.titleLabel.text = "组织仓库链接"
            self.valueLabel.text = model.organizationRepositoriesUrl
            
        case 20:
            self.titleLabel.text = "组织团队链接"
            self.valueLabel.text = model.organizationTeamsUrl
            
        case 21:
            self.titleLabel.text = "公共凭证链接"
            self.valueLabel.text = model.publicGistsUrl
            
            case 22:
        self.titleLabel.text = "速率权限链接"
            self.valueLabel.text = model.rateLimitUrl
            
        case 23:
            self.titleLabel.text = "仓库链接"
            self.valueLabel.text = model.repositoryUrl
            
        case 24:
            self.titleLabel.text = "仓库查询链接"
            self.valueLabel.text = model.repositorySearchUrl
            
        case 25:
            self.titleLabel.text = "当前用户仓库链接"
            self.valueLabel.text = model.currentUserRepositoriesUrl
            
        case 26:
            self.titleLabel.text = "管理员链接"
            self.valueLabel.text = model.starredUrl
            
        case 27:
            self.titleLabel.text = "管理员凭证链接"
            self.valueLabel.text = model.starredGistsUrl
            
        case 28:
            self.titleLabel.text = "用户链接"
            self.valueLabel.text = model.userUrl
            
        case 29:
            self.titleLabel.text = "用户组织链接"
            self.valueLabel.text = model.userOrganizationsUrl
            
        case 30:
            self.titleLabel.text = "用户存储链接"
            self.valueLabel.text = model.userRepositoriesUrl
            
        case 31:
            self.titleLabel.text = "用户搜索链接"
            self.valueLabel.text = model.userSearchUrl
            
        default: break
            
        }
    }
    
    
    /**
    *  数据填充：历史数据
    *  @creator    Eric
    *
    *  @param      date            加载时间
    */
    
    func fillCellWithDate(date: String) {
        
        self.titleLabel.text = "加载时间"
        self.valueLabel.text = date
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.valueLabel.sizeToFit()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
