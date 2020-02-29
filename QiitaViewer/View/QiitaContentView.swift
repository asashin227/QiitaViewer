//
//  QiitaContentView.swift
//  QiitaViewer
//
//  Created by Asakura Shinsuke on 2020/02/29.
//  Copyright © 2020 Asakura  Shinsuke. All rights reserved.
//

import SwiftUI

struct QiitaContentView: View {
    let title: String
    let urlString: String
    
    var body: some View {
        NavigationView {
            WebView(urlString: urlString)
        }
        .navigationBarTitle(Text(title))
    }
}

struct QiitaContentView_Previews: PreviewProvider {
    static var previews: some View {
        QiitaContentView(title: "タイトル", urlString: "https://google.com")
    }
}
