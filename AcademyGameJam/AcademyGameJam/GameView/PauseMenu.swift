//  PauseMenu.swift
//  AcademyGameJam
//
//  Created by Filipe Ilunga on 04/05/24.
//
import SwiftUI
import GameKit

struct PauseMenu: View {
    @State var showSettings: Bool = false
    @EnvironmentObject var soundManager: MusicController
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: MusicGameCard()) {
                    CustomButton(label: "Settings", iconName: "gearshape.fill")
                }
                
            }
            .padding(.horizontal, 80)
            .padding(.vertical, 20)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
        }
        .frame(maxWidth: UIScreen.main.bounds.width * 0.5, maxHeight: UIScreen.main.bounds.height * 0.80)
        .cornerRadius(10)

        .onAppear {
            DispatchQueue.main.async {
                if !GKLocalPlayer.local.isAuthenticated {
                    authenticateUser()
                }
            }
        }
    }
    
    func authenticateUser() {
        DispatchQueue.main.async {
            GKLocalPlayer.local.authenticateHandler = { vc, error in
                guard error == nil else {
                    print(error?.localizedDescription ?? "")
                    return
                }
            }
        }
    }
}
