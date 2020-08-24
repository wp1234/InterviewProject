//
//  TVMessageModel.swift
//  InterviewProject
//
//  Created by Eric on 2020/8/21.
//  Copyright © 2020 Tortuga Ventures. All rights reserved.
//

import UIKit

class TVMessageModel: Codable {

    
    var currentUserUrl: String
    var currentUserAuthorizationsHtmlUrl: String
    var authorizationsUrl: String
    var codeSearchUrl: String
    var commitSearchUrl: String
    var emailsUrl: String
    var emojisUrl: String
    var eventsUrl: String
    var feedsUrl: String
    var followersUrl: String
    var followingUrl: String
    var gistsUrl: String
    var hubUrl: String
    var issueSearchUrl: String
    var issuesUrl: String
    var keysUrl: String
    var labelSearchUrl: String
    var notificationsUrl: String
    var organizationUrl: String
    var organizationRepositoriesUrl: String
    var organizationTeamsUrl: String
    var publicGistsUrl: String
    var rateLimitUrl: String
    var repositoryUrl: String
    var repositorySearchUrl: String
    var currentUserRepositoriesUrl: String
    var starredUrl: String
    var starredGistsUrl: String
    var userUrl: String
    var userOrganizationsUrl: String
    var userRepositoriesUrl: String
    var userSearchUrl: String
    
    init(currentUserUrl: String, currentUserAuthorizationsHtmlUrl: String, authorizationsUrl: String, codeSearchUrl: String, commitSearchUrl: String, emailsUrl: String, emojisUrl: String, eventsUrl: String, feedsUrl: String, followersUrl: String, followingUrl: String, gistsUrl: String, hubUrl: String, issueSearchUrl: String, issuesUrl: String, keysUrl: String, labelSearchUrl: String, notificationsUrl: String, organizationUrl: String, organizationRepositoriesUrl: String, organizationTeamsUrl: String, publicGistsUrl: String, rateLimitUrl: String, repositoryUrl: String, repositorySearchUrl: String, currentUserRepositoriesUrl: String, starredUrl: String, starredGistsUrl: String, userUrl: String, userOrganizationsUrl: String, userRepositoriesUrl: String, userSearchUrl: String) {
        self.currentUserUrl = currentUserUrl
        self.currentUserAuthorizationsHtmlUrl = currentUserAuthorizationsHtmlUrl
        self.authorizationsUrl = authorizationsUrl
        self.codeSearchUrl = codeSearchUrl
        self.commitSearchUrl = commitSearchUrl
        self.emailsUrl = emailsUrl
        self.emojisUrl = emojisUrl
        self.eventsUrl = eventsUrl
        self.feedsUrl = feedsUrl
        self.followersUrl = followersUrl
        self.followingUrl = followingUrl
        self.gistsUrl = gistsUrl
        self.hubUrl = hubUrl
        self.issueSearchUrl = issueSearchUrl
        self.issuesUrl = issuesUrl
        self.keysUrl = keysUrl
        self.labelSearchUrl = labelSearchUrl
        self.notificationsUrl = notificationsUrl
        self.organizationUrl = organizationUrl
        self.organizationRepositoriesUrl = organizationRepositoriesUrl
        self.organizationTeamsUrl = organizationTeamsUrl
        self.publicGistsUrl = publicGistsUrl
        self.rateLimitUrl = rateLimitUrl
        self.repositoryUrl = repositoryUrl
        self.repositorySearchUrl = repositorySearchUrl
        self.currentUserRepositoriesUrl = currentUserRepositoriesUrl
        self.starredUrl = starredUrl
        self.starredGistsUrl = starredGistsUrl
        self.userUrl = userUrl
        self.userOrganizationsUrl = userOrganizationsUrl
        self.userRepositoriesUrl = userRepositoriesUrl
        self.userSearchUrl = userSearchUrl
    }
    
    
    private enum CodingKeys : String, CodingKey {
        case currentUserUrl = "current_user_url"
        case currentUserAuthorizationsHtmlUrl = "current_user_authorizations_html_url"
        case authorizationsUrl = "authorizations_url"
        case codeSearchUrl = "code_search_url"
        case commitSearchUrl = "commit_search_url"
        case emailsUrl = "emails_url"
        case emojisUrl = "emojis_url"
        case eventsUrl = "events_url"
        case feedsUrl = "feeds_url"
        case followersUrl = "followers_url"
        case followingUrl = "following_url"
        case gistsUrl = "gists_url"
        case hubUrl = "hub_url"
        case issueSearchUrl = "issue_search_url"
        case issuesUrl = "issues_url"
        case keysUrl = "keys_url"
        case labelSearchUrl = "label_search_url"
        case notificationsUrl = "notifications_url"
        case organizationUrl = "organization_url"
        case organizationRepositoriesUrl = "organization_repositories_url"
        case organizationTeamsUrl = "organization_teams_url"
        case publicGistsUrl = "public_gists_url"
        case rateLimitUrl = "rate_limit_url"
        case repositoryUrl = "repository_url"
        case repositorySearchUrl = "repository_search_url"
        case currentUserRepositoriesUrl = "current_user_repositories_url"
        case starredUrl = "starred_url"
        case starredGistsUrl = "starred_gists_url"
        case userUrl = "user_url"
        case userOrganizationsUrl = "user_organizations_url"
        case userRepositoriesUrl = "user_repositories_url"
        case userSearchUrl = "user_search_url"                  
    }
    
}
