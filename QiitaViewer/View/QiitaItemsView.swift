//
//  QiitaItemsView.swift
//  QiitaViewer
//
//  Created by Asakura Shinsuke on 2020/02/29.
//  Copyright © 2020 Asakura  Shinsuke. All rights reserved.
//

import SwiftUI

struct QiitaItemsView: View {
    let userId = "asashin227"
    let page = 1
    let parPage = 100
    
    var body: some View {
        NavigationView {
            QiitaItemList(userId: userId, page: page, parPage: parPage)
                .navigationBarTitle(Text("Qiita Items"))
        }
    }
}

struct QiitaItemsView_Previews: PreviewProvider {
    static var previews: some View {
        QiitaItemsView()
    }
}
