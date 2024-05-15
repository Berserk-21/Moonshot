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
        Button("Decode astro") {
            let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
            print(astronauts.count)
        }
        
        Button("Decode mission") {
            let missions: [Mission] = Bundle.main.decode("missions.json")
            print(missions)
        }
    }
}

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}

struct Mission: Codable, Identifiable {
    
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let crew: [CrewRole]
    let description: String
    let launchDate: String?
}


#Preview {
    ContentView()
}
