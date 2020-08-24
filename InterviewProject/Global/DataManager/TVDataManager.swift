//
//  TVDataManager.swift
//  InterviewProject
//
//  Created by Eric on 2020/8/21.
//  Copyright © 2020 Tortuga Ventures. All rights reserved.
//

import UIKit
import CoreData

class TVDataManager: NSObject {

    static let sharedInstance = TVDataManager()
    
    lazy var context: NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }()
    
    override init() {
        super.init()
    }
    
    /**
    *  获取最新一条数据
    *  @creator    Eric
    *
    *  return date:          数据日期
    *  return messageModel:  数据信息
    */
    func getOneNewDataFromDB() -> (date: String?, messageModel: TVMessageModel?) {
        let fetchRequest: NSFetchRequest = TVMessage.fetchRequest()
        fetchRequest.fetchOffset = 0
        fetchRequest.fetchLimit = 1
        let sort = NSSortDescriptor(key: "date", ascending: false)
        fetchRequest.sortDescriptors = [sort]
        do {
            let result = try context.fetch(fetchRequest)
            
            if result.count == 0 {
                return (nil, nil)
            } else {

                let message = result.first!
                
                let firtMessageModel = TVMessageModel.init(currentUserUrl: message.current_user_url!, currentUserAuthorizationsHtmlUrl: message.current_user_authorizations_html_url!, authorizationsUrl: message.authorizations_url!, codeSearchUrl: message.code_search_url!, commitSearchUrl: message.commit_search_url!, emailsUrl: message.emails_url!, emojisUrl: message.emojis_url!, eventsUrl: message.events_url!, feedsUrl: message.feeds_url!, followersUrl: message.followers_url!, followingUrl: message.following_url!, gistsUrl: message.gists_url!, hubUrl: message.hub_url!, issueSearchUrl: message.issue_search_url!, issuesUrl: message.issues_url!, keysUrl: message.keys_url!, labelSearchUrl: message.label_search_url!, notificationsUrl: message.notifications_url!, organizationUrl: message.organization_url!, organizationRepositoriesUrl: message.organization_repositories_url!, organizationTeamsUrl: message.organization_teams_url!, publicGistsUrl: message.public_gists_url!, rateLimitUrl: message.rate_limit_url!, repositoryUrl: message.repository_url!, repositorySearchUrl: message.repository_search_url!, currentUserRepositoriesUrl: message.current_user_repositories_url!, starredUrl: message.starred_url!, starredGistsUrl: message.starred_gists_url!, userUrl: message.user_url!, userOrganizationsUrl: message.user_organizations_url!, userRepositoriesUrl: message.user_repositories_url!, userSearchUrl: message.user_search_url!)
                return (message.date, firtMessageModel)
            }
        } catch {
            fatalError();
        }
    }
    
    /**
    *  存储一条数据
    *  @creator    Eric
    *
    *  parameter    messageModel    信息模型
    *  parameter    date            加载时间
    *
    */
    func saveData(withModel messageModel: TVMessageModel, date: String) {
        let newMessage = NSEntityDescription.insertNewObject(forEntityName: "TVMessage", into: context) as! TVMessage
        newMessage.date = date
        newMessage.current_user_url = messageModel.currentUserUrl
        newMessage.current_user_authorizations_html_url = messageModel.currentUserAuthorizationsHtmlUrl
        newMessage.authorizations_url = messageModel.authorizationsUrl
        newMessage.code_search_url = messageModel.codeSearchUrl
        newMessage.commit_search_url = messageModel.commitSearchUrl
        newMessage.emails_url = messageModel.emailsUrl
        newMessage.emojis_url = messageModel.emojisUrl
        newMessage.events_url = messageModel.eventsUrl
        newMessage.feeds_url = messageModel.feedsUrl
        newMessage.followers_url = messageModel.followersUrl
        newMessage.following_url = messageModel.followingUrl
        newMessage.gists_url = messageModel.gistsUrl
        newMessage.hub_url = messageModel.hubUrl
        newMessage.issue_search_url = messageModel.issueSearchUrl
        newMessage.issues_url = messageModel.issuesUrl
        newMessage.keys_url = messageModel.keysUrl
        newMessage.label_search_url = messageModel.labelSearchUrl
        newMessage.notifications_url = messageModel.notificationsUrl
        newMessage.organization_url = messageModel.organizationUrl
        newMessage.organization_repositories_url = messageModel.organizationRepositoriesUrl
        newMessage.organization_teams_url = messageModel.organizationTeamsUrl
        newMessage.public_gists_url = messageModel.publicGistsUrl
        newMessage.rate_limit_url = messageModel.rateLimitUrl
        newMessage.repository_url = messageModel.repositoryUrl
        newMessage.repository_search_url = messageModel.repositorySearchUrl
        newMessage.current_user_repositories_url = messageModel.currentUserRepositoriesUrl
        newMessage.starred_url = messageModel.starredUrl
        newMessage.starred_gists_url = messageModel.starredGistsUrl
        newMessage.user_url = messageModel.userUrl
        newMessage.user_organizations_url = messageModel.userOrganizationsUrl
        newMessage.user_repositories_url = messageModel.userRepositoriesUrl
        newMessage.user_search_url = messageModel.userSearchUrl
        
        //保存
        do{
            try context.save()
        }catch{
            fatalError()
        }
    }
    
    /**
    *  分页查询数据
    *  @creator     Eric
    *  parameter    number  当前页码
    *  parameter    size    页面大小
    *
    *  return   获取数据
    */
    func getDataFromDB(withPage number: Int, size: Int) -> [(date: String?, messageModel: TVMessageModel?)] {
        let fetchRequest: NSFetchRequest = TVMessage.fetchRequest()
        fetchRequest.fetchOffset = number * size
        fetchRequest.fetchLimit = size
        let sort = NSSortDescriptor(key: "date", ascending: false)
        fetchRequest.sortDescriptors = [sort]
        do {
            let result = try context.fetch(fetchRequest)
            
            if result.count == 0 {
                return [(nil, nil)]
            } else {
                var dataArr = [(date: String?, messageModel: TVMessageModel?)]()
                for message in result {
                    let messageModel = TVMessageModel.init(currentUserUrl: message.current_user_url!, currentUserAuthorizationsHtmlUrl: message.current_user_authorizations_html_url!, authorizationsUrl: message.authorizations_url!, codeSearchUrl: message.code_search_url!, commitSearchUrl: message.commit_search_url!, emailsUrl: message.emails_url!, emojisUrl: message.emojis_url!, eventsUrl: message.events_url!, feedsUrl: message.feeds_url!, followersUrl: message.followers_url!, followingUrl: message.following_url!, gistsUrl: message.gists_url!, hubUrl: message.hub_url!, issueSearchUrl: message.issue_search_url!, issuesUrl: message.issues_url!, keysUrl: message.keys_url!, labelSearchUrl: message.label_search_url!, notificationsUrl: message.notifications_url!, organizationUrl: message.organization_url!, organizationRepositoriesUrl: message.organization_repositories_url!, organizationTeamsUrl: message.organization_teams_url!, publicGistsUrl: message.public_gists_url!, rateLimitUrl: message.rate_limit_url!, repositoryUrl: message.repository_url!, repositorySearchUrl: message.repository_search_url!, currentUserRepositoriesUrl: message.current_user_repositories_url!, starredUrl: message.starred_url!, starredGistsUrl: message.starred_gists_url!, userUrl: message.user_url!, userOrganizationsUrl: message.user_organizations_url!, userRepositoriesUrl: message.user_repositories_url!, userSearchUrl: message.user_search_url!)
                    dataArr.append((message.date, messageModel))
                }
                
                return dataArr
            }
        } catch {
            fatalError();
        }
    }
    
}
