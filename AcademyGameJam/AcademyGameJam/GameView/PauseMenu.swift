//  PauseMenu.swift
//  AcademyGameJam
//
//  Created by Filipe Ilunga on 04/05/24.
//
import SwiftUI
import GameKit

struct PauseMenu: View {
    @State var showRanking: Bool = false
    @State var showSettings: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                CustomButton(label: "Restart", iconName: "arrow.counterclockwise.circle.fill")
                CustomButton(label: "Ranking", iconName: "list.number").onTapGesture {
                    showRanking.toggle()
                }
                                
                CustomButton(label: "Settings", iconName: "gearshape.fill")
                
                NavigationLink(destination: CreditsView()) {
                   
                    CustomButton(label: "Credits", iconName: "list.star")
                }
                .padding(.top, 20)
                
            }
            .padding(.horizontal, 80)
            .padding(.vertical, 20)
            .background(Color.white)
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
