//
//  ContentView.swift
//  Moonshot
//
//  Created by Berserk on 15/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink() {
                Text("Detail View")
            } label: {
                VStack {
                    Text("This is the title")
                    Text("This is the subtitle")
                    Image(systemName: "face.smiling")
                }
                .font(.largeTitle)
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    ContentView()
}
