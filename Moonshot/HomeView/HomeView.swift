//
//  HomeView.swift
//  Moonshot
//
//  Created by Berserk on 15/05/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showGrid = false
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationStack {
            Group {
                if showGrid {
                    MissionsGridView(missions: missions, astronauts: astronauts)
                } else {
                    MissionsListView(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button(showGrid ? "Grid" : "List") {
                    showGrid.toggle()
                }
            }
        }
    }
}

struct Mission: Codable, Identifiable, Hashable {
    
    struct CrewRole: Codable, Hashable {
        let name: String
        let role: String
    }
    
    let id: Int
    let crew: [CrewRole]
    let description: String
    let launchDate: Date?
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    var formattedExtendedLaunchDate: String {
        launchDate?.formatted(date: .long, time: .omitted) ?? "N/A"
    }
}


#Preview {
    HomeView()
}
