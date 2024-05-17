//
//  MissionsGridView.swift
//  Moonshot
//
//  Created by Berserk on 16/05/2024.
//

import SwiftUI

struct MissionsGridView: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 24) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionDetailView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack(spacing: 4) {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical)
                            .background(.lightBackground)
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        }
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionsGridView(missions: missions, astronauts: astronauts)
}
