//
//  OfflineView.swift
//  Das Bibelquiz
//
//  Created by Dominik Sigmund on 25.10.22.
//

import SwiftUI

struct OfflineView: View {
    @State private var willMoveToNextScreen = false

    var body: some View {
        VStack {
            Image("Offline")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140.0)
            Spacer(minLength: 5.0)
            Text("Du bist leider Offline.")
                .font(.largeTitle)
            Spacer(minLength: 5.0)
            Button("Neu Laden") {
                willMoveToNextScreen = true
            }
            .font(.largeTitle)
        }
        .navigate(to: ContentView(), when: $willMoveToNextScreen)
                
    }
}

struct OfflineView_Previews: PreviewProvider {
    static var previews: some View {
        OfflineView()
    }
}

extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
