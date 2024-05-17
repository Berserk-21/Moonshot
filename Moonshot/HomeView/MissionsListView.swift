//
//  MissionsListView.swift
//  Moonshot
//
//  Created by Berserk on 16/05/2024.
//

import SwiftUI

struct MissionsListView: View {
    
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionDetailView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75, height: 75)
                            .padding(.trailing)
                        
                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white)
                        }
                        Spacer()
                    }
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.lightBackground)
                    }
                }
            }
            .listRowBackground(Color.clear)
            .listStyle(.plain)
        }
        .background(.clear)
        .scrollContentBackground(.hidden)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionsListView(missions: missions, astronauts: astronauts)
}
