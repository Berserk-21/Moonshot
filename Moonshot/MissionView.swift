//
//  MissionView.swift
//  Moonshot
//
//  Created by Berserk on 15/05/2024.
//

import SwiftUI

struct MissionView: View {
    
    let mission: Mission
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map({ member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Couldn't get crew member details for \(member.name)")
            }
        })
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding(.top)
                Text(mission.formattedExtendedLaunchDate)
                    .padding()
                
                VStack(alignment: .leading, content: {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    HorizontalDividerView()
                    Text(mission.description)
                    HorizontalDividerView()
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                })
                .padding(.horizontal)
                
                CrewMembersView(crew: crew)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[1], astronauts: astronauts)
}
