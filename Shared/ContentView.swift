//
//  ContentView.swift
//  Shared
//
//  Created by Dominik Sigmund on 03.08.22.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
        WebView(url: URL(string: "https://dasbibelquiz.de")!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
