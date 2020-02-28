//
//  UserItem.swift
//  QiitaRepository
//
//  Created by Asakura  Shinsuke on 2020/02/28.
//  Copyright © 2020 Asakura  Shinsuke. All rights reserved.
//

import Foundation

public struct UserItem: Codable {
    
    private enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case title
        case url
        case body
        case coediting
        case commentsCount = "comments_count"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case group
        case likesCount = "likes_count"
        case pageViewsCount = "page_views_count"
        case `private`
        case reactionsCount = "reactions_count"
        case renderedBody = "rendered_body"
        case tags
        case user
    }
    
    public let id: String
    public let title: String
    public let url: String
    let body: String
    let coediting: Int
    let commentsCount: Int
    let createdAt: Date
    let updatedAt: Date
    let group: String?
    let likesCount: Int
    let pageViewsCount: Int?
    let `private`: Int
    let reactionsCount: Int
    let renderedBody: String
    let tags: [Tag]
    let user: User
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        url = try container.decode(String.self, forKey: .url)
        body = try container.decode(String.self, forKey: .body)
//        coediting = try container.decode(Int.self, forKey: .coediting)
        commentsCount = try container.decode(Int.self, forKey: .commentsCount)
//        createdAt = try container.decode(Date.self, forKey: .createdAt)
//        updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        group = try container.decodeIfPresent(String.self, forKey: .group)
        likesCount = try container.decode(Int.self, forKey: .likesCount)
        pageViewsCount = try container.decodeIfPresent(Int.self, forKey: .pageViewsCount)
//        `private` = try container.decode(Int.self, forKey: .private)
        reactionsCount = try container.decode(Int.self, forKey: .reactionsCount)
        renderedBody = try container.decode(String.self, forKey: .renderedBody)
        tags = try container.decode([Tag].self, forKey: .tags)
        user = try container.decode(User.self, forKey: .user)
        
        coediting = 0
        createdAt = Date()
        updatedAt = Date()
        `private` = 0
    }
}

public struct Tag: Codable {
    let name: String
    let versions: [String]
    
}

public struct User: Codable {
    private enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case description
        case location
        case organization
        case facebookId = "facebook_id"
        case followeesCount = "followees_count"
        case followersCount = "followers_count"
        case githubLoginName = "github_login_name"
        case itemsCount = "items_count"
        case linkedinId = "linkedin_id"
        case permanentId = "permanent_id"
        case profileImageUrl = "profile_image_url"
        case teamOnly = "team_only"
        case twitterScreenName = "twitter_screen_name"
        case websiteUrl = "website_url"
    }
    
    let description: String
    let facebookId: String
    let followeesCount: Int
    let followersCount: Int
    let githubLoginName: String
    let id: String
    let itemsCount: Int
    let linkedinId: String
    let location: String
    let name: String
    let organization: String
    let permanentId: Int
    let profileImageUrl: String
    let teamOnly: Int
    let twitterScreenName: String
    let websiteUrl: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        description = try container.decode(String.self, forKey:.description)
        facebookId = try container.decode( String.self, forKey: .facebookId)
        followeesCount = try container.decode(Int.self, forKey: .followeesCount)
        followersCount = try container.decode( Int.self, forKey: .followersCount)
        githubLoginName = try container.decode(String.self, forKey: .githubLoginName)
        id = try container.decode(String.self, forKey: .id)
        itemsCount = try container.decode(Int.self, forKey: .itemsCount)
        linkedinId = try container.decode(String.self, forKey: .linkedinId)
        location = try container.decode(String.self, forKey: .location)
        name = try container.decode(String.self, forKey: .name)
        organization = try container.decode(String.self, forKey: .organization)
        permanentId = try container.decode(Int.self, forKey: .permanentId)
        profileImageUrl = try container.decode(String.self, forKey: .profileImageUrl)
//        teamOnly = try container.decode(Int.self, forKey: .teamOnly)
        twitterScreenName = try container.decode(String.self, forKey: .twitterScreenName)
        websiteUrl = try container.decode(String.self, forKey: .websiteUrl)
        
        teamOnly = 0
    }
    
}
