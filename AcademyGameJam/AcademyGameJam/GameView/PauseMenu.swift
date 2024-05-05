//  PauseMenu.swift
//  AcademyGameJam
//
//  Created by Filipe Ilunga on 04/05/24.
//

import SwiftUI
import GameKit
import SwiftUI
import GameKit

struct PauseMenu: View {
    @State var showRanking: Bool = false
    @State var showSettings: Bool = false
    
    var body: some View {
        VStack {
            
            Button {
                
            } label: {
                HStack {
                    Image(systemName: "arrow.counterclockwise.circle.fill")
                        .font(.title)
                        .bold()
                    Text("Restart")
                        .font(.title3)
                }
                .foregroundStyle(.white)
                .padding(5)
                .padding(.horizontal, 10)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.ultraThinMaterial)
                        .shadow(color: .black.opacity(0.45), radius: 5, y: 5)
                }
            }
            
            Button {
                showRanking.toggle()
            } label: {
                HStack {
                    Image(systemName: "list.number")
                        .font(.title)
                        .bold()
                    Text("Ranking")
                        .font(.title3)
                }
                .foregroundStyle(.white)
                .padding(5)
                .padding(.horizontal, 10)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.ultraThinMaterial)
                        .shadow(color: .black.opacity(0.45), radius: 5, y: 5)
                }
            }
            
            NavigationLink {
                Text("ola")
            } label: {
                HStack {
                    Image(systemName: "gearshape.fill")
                        .font(.title)
                        .bold()
                    Text("Settings")
                        .font(.title3)
                }
                .foregroundStyle(.white)
                .padding(5)
                .padding(.horizontal, 10)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.ultraThinMaterial)
                        .shadow(color: .black.opacity(0.45), radius: 5, y: 5)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.5)
        .background(Color.green)
        .cornerRadius(10)
        .onAppear {
            DispatchQueue.main.async {
                if !GKLocalPlayer.local.isAuthenticated {
                    authenticateUser()
                }
            }
        }
        .fullScreenCover(isPresented: $showRanking) {
            GameCenterView()
                .ignoresSafeArea()
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
