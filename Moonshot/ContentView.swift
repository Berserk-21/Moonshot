//
//  ContentView.swift
//  Moonshot
//
//  Created by Berserk on 15/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
        GridItem(.adaptive(minimum: 80, maximum: 120)),
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        Button("Decode") {
            let astronauts = Bundle.main.decode("astronauts")
            print(astronauts.count)
        }
    }
}

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}



#Preview {
    ContentView()
}
