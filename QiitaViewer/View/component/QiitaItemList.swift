//
//  QiitaItemList.swift
//  QiitaViewer
//
//  Created by Asakura  Shinsuke on 2020/02/28.
//  Copyright © 2020 Asakura  Shinsuke. All rights reserved.
//

import SwiftUI

struct QiitaItemList: View {
    @ObservedObject var repository = RepositoryContainer.UserItemRepository
    let userId: String
    let page: Int
    let parPage: Int
    
    init(userId: String, page: Int, parPage: Int) {
        self.userId = userId
        self.page = page
        self.parPage = parPage
        repository.getItems(userId: userId, page: page, parPage: parPage)
    }
    
    var body: some View {
        if let error = repository.error {
            // TODO: エラー時
            print("failure: \(error)")
        }
        
        return List(repository.result) { item in
            NavigationLink(destination: QiitaContentView(title: item.title, urlString: item.url)) {
                QiitaItemRow(item: item)
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct QiitaItemList_Previews: PreviewProvider {
    static var previews: some View {
        QiitaItemList(userId: "asashin227", page: 0, parPage: 100)
    }
}
