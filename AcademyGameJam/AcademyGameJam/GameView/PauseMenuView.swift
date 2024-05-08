//  PauseMenu.swift
//  AcademyGameJam
//
//  Created by Filipe Ilunga on 04/05/24.
//
import SwiftUI
import GameKit

struct PauseMenuView: View {
    @EnvironmentObject var soundManager: MusicController
    
    var body: some View {
        VStack {
            NavigationLink(destination: MusicGameCard()) {
                CustomButton(label: "Settings", iconName: "gearshape.fill")
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(20)
    }
}


#Preview {
    NavigationStack {
        PauseMenuView()
    }
    .environmentObject(MusicController())
}

