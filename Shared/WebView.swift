//
//  WebView.swift
//  Das Bibelquiz
//
//  Created by Dominik Sigmund on 03.08.22.
//  Found: https://www.appcoda.com/swiftui-wkwebview/
//

import SwiftUI
import WebKit
 
struct WebView: UIViewRepresentable {
 
    var url: URL

    class Coordinator: NSObject, WKNavigationDelegate {
            var parent: WebView

            init(_ parent: WebView) {
                self.parent = parent
            }

            // Delegate methods go here

        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
                if let url = navigationAction.request.url {
                    if !url.absoluteString.starts(with: "https://dasbibelquiz.de") {
                        UIApplication.shared.open(url)
                        decisionHandler(.cancel)
                        return
                    }
                }

                decisionHandler(.allow)
            }
        }

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.navigationDelegate = context.coordinator
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true
    }
    
}
