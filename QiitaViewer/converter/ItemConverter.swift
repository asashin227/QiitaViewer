//
//  ItemConverter.swift
//  QiitaViewer
//
//  Created by Asakura  Shinsuke on 2020/02/28.
//  Copyright © 2020 Asakura  Shinsuke. All rights reserved.
//

import QiitaRepository

struct ItemConverter {
    
    static func converts(userItems: [QiitaRepository.UserItem]) -> [Item] {
        return userItems.map {
            self.convert(userItem: $0)
        }
    }
    
    static func convert(userItem: QiitaRepository.UserItem) -> Item {
        return Item(id: userItem.id, title: userItem.title, url: userItem.url)
    }
}
