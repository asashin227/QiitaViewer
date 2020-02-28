//
//  QiitaItemRow.swift
//  QiitaViewer
//
//  Created by Asakura  Shinsuke on 2020/02/28.
//  Copyright © 2020 Asakura  Shinsuke. All rights reserved.
//

import SwiftUI

struct QiitaItemRow : View {
    
    var item: Item
    
    var body: some View {
        return Text(item.title)
    }
}

private let items: [Item] = [Item(id:"000", title: "テスト000", url: ""),
                             Item(id:"001", title: "テスト001", url: ""),
                             Item(id:"002", title: "テスト002", url: "")]

struct QiitaItemRow_Previews: PreviewProvider {
    static var previews: some View {
        List(0 ..< items.count) { num in
            QiitaItemRow(item: items[num])
        }
    }
}
