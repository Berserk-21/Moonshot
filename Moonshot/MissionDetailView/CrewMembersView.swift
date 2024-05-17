//
//  CrewMembersView.swift
//  Moonshot
//
//  Created by Berserk on 16/05/2024.
//

import SwiftUI

struct CrewMembersView: View {
    
    let crew: [CrewMember]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink(value: crewMember) {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay {
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                }
                            VStack(alignment: .leading, content: {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            })
                        }
                        .padding()
                    }
                }
            }
            .navigationDestination(for: CrewMember.self) { crewMember in
                AstronautDetailView(astronaut: crewMember.astronaut)
            }
        }
    }
}

struct CrewMember: Codable, Hashable {
    let role: String
    let astronaut: Astronaut
}

struct Astronaut: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
}
