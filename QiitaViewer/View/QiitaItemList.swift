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
    let userId = "asashin227"
    let page = 1
    let parPage = 100
    
    init() {
        repository.getItems(userId: userId, page: page, parPage: parPage)
    }
    
    var body: some View {
        if 0 < repository.result.count {
            return NavigationView {
                List(repository.result) { item in
                    //            NavigationLink(destination: LandmarkDetail()) {
                    QiitaItemRow(item: item)
                    //            }
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle(Text("Qiita Items"))
            }
        } else if let error = repository.error {
            // TODO: エラー時
            print("failure: \(error)")
        }
        // TODO: 仮で入れてるので消す
        return NavigationView {
            List([Item(id: "", title: "未取得", url: "")]) { item in
                QiitaItemRow(item: item)
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Qiita Items"))
        }
    }
}

struct QiitaItemList_Previews: PreviewProvider {
    static var previews: some View {
        QiitaItemList()
    }
}
