//
//  ContentView.swift
//  Shared
//
//  Created by Dominik Sigmund on 03.08.22.
//

import SwiftUI
import Reachability


struct ContentView: View {
    let reachability = try! Reachability()
    var body: some View {
        if (reachability.connection != .unavailable) {
            WebView(url: URL(string: "https://dasbibelquiz.de")!)
        } else {
            OfflineView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
