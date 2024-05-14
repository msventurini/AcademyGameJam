//
//  Menu.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 05/05/24.
//

import SwiftUI
import GameKit

struct MainMenuView: View {
    @EnvironmentObject private var router: Router
    @EnvironmentObject var soundManager: MusicController
    
    @State private var showRanking: Bool = false
    @State private var shouldRestart: Bool = false
    
    var body: some View {
       GeometryReader { reader in
           VStack {
               HStack {
                   Image("bee")
                       .resizable()
                       .scaledToFit()
                       .frame(height: reader.frame(in: .global).width * 0.3)

                   Spacer()
                   
                   Image("bee")
                       .resizable()
                       .scaledToFit()
                       .frame(height: reader.frame(in: .global).width * 0.3)
                       .scaleEffect(x: -1)
               }
               
               Spacer()
           }
           .padding()
           
            HStack {
                Spacer()
                
                VStack(spacing: 16) {
                    Spacer()
                    
                    Text("Flower Hive")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    CustomButton(label: "Play", iconName: "play.fill", buttonWidth: reader.size.width * 0.3)
                        .padding(.bottom)
                        .onTapGesture {
                            router.push(Routes.Game(shouldRestart: $shouldRestart))
                        }
                        .disabled(shouldRestart)
                    
                    HStack(spacing: 16) {
                        CustomButton(label: "Ranking", iconName: "list.number", buttonWidth: reader.size.width * 0.3)
                            .onTapGesture {
                                showRanking.toggle()
                        }
                        
                        CustomButton(label: "Credits", iconName: "person.3", buttonWidth: reader.size.width * 0.3)
                            .onTapGesture {
                                router.push(Routes.Credits)
                            }
                    }
                }
                
                Spacer()
            }
            .padding()
        }
       .onChange(of: shouldRestart) {
           if shouldRestart {
               router.pop()
               DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                   router.push(Routes.Game(shouldRestart: $shouldRestart))
                   shouldRestart = false
               }
           }
       }
       .fullScreenCover(isPresented: $showRanking) {
           GameCenterView()
               .ignoresSafeArea()
       }
       .onAppear {
           soundManager.pauseSound()
           
           DispatchQueue.main.async {
               if !GKLocalPlayer.local.isAuthenticated {
                   GameCenterUtility.authenticateUser()
               }
           }
       }
    }
}

#Preview {
    RouterView(initialRoute: Routes.MainMenu)
    .environmentObject(MusicController())
}
