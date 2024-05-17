//
//  AstronautDetailView.swift
//  Moonshot
//
//  Created by Berserk on 16/05/2024.
//

import SwiftUI

struct AstronautDetailView: View {
    
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                Text(astronaut.description)
                    .padding()
            }
            .preferredColorScheme(.dark)
            .background(.darkBackground)
        }
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautDetailView(astronaut: astronauts["aldrin"]!)
}
