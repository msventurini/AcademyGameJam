//  PauseMenu.swift
//  AcademyGameJam
//
//  Created by Filipe Ilunga on 04/05/24.
//

import SwiftUI
import GameKit

struct PauseMenu: View {
    @State var show: Bool = false
    var body: some View {
        VStack {
            Button {
                show.toggle()
            } label: {
                Text("Exibir ranking")
            }
            Button {
                // Implement your submit score functionality here
            } label: {
                Text("Submite score")
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.8)
        .background(Color.red)
        .cornerRadius(10)
        .onAppear {
            if !GKLocalPlayer.local.isAuthenticated {
                    authenticateUser()
            }
        }
        .fullScreenCover(isPresented: $show) {
            GameCenterView()
                .ignoresSafeArea()
        }
    }
    
    func authenticateUser() {
        GKLocalPlayer.local.authenticateHandler = { vc, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
        }
    }
}

struct PauseMenu_Previews: PreviewProvider {
    static var previews: some View {
        PauseMenu()
    }
}
