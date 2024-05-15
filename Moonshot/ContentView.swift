//
//  ContentView.swift
//  Moonshot
//
//  Created by Berserk on 15/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10, content: {
                ForEach(0..<100) {
                    CustomText(text: "\($0)")
                        .font(.title)
                }
            })
            .frame(maxWidth: .infinity)
        }
    }
}

struct CustomText: View {
    
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

#Preview {
    ContentView()
}
