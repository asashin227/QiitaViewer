//
//  GetUserItem.swift
//  QiitaRepository
//
//  Created by Asakura  Shinsuke on 2020/02/28.
//  Copyright © 2020 Asakura  Shinsuke. All rights reserved.
//

import UIKit

public struct GetUserItem: Request {    
    public typealias ResultType = [UserItem]
    let userId: String
    let page: Int
    let parPage: Int
    
    public init(userId: String, page: Int, parPage: Int) {
        self.userId = userId
        self.page = page
        self.parPage = parPage
    }
}

extension GetUserItem {
    public var path: String {
        return "/api/v2/users/\(userId)/items?page=\(page)&per_page=\(parPage)"
    }
    public var method: HTTPMethod {
        return .GET
    }
}
