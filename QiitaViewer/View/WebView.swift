//
//  WebView.swift
//  QiitaViewer
//
//  Created by Asakura Shinsuke on 2020/02/29.
//  Copyright © 2020 Asakura  Shinsuke. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var urlString: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: urlString)!))
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(urlString: "https://google.com")
    }
}
