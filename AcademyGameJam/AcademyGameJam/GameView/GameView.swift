//
//  ContentView.swift
//  WorldGame
//
//  Created by Gustavo Diefenbach on 01/09/23.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    @StateObject private var scene: GameScene = GameScene()
                                   
    var time: (hour: String, minute: String) {
        let time = scene.timer.quotientAndRemainder(dividingBy: 60)
        
        return (hour: time.quotient > 9 ? "\(time.quotient)" : "0\(time.quotient)",
                minute: time.remainder > 9 ? "\(time.remainder)" : "0\(time.remainder)")
    }
    
    var body: some View {
        ZStack {
            GeometryReader { reader in
                SpriteView(scene: scene, debugOptions: [.showsPhysics, .showsFPS, .showsNodeCount])
                    .onAppear {
                        scene.size = reader.size
                    }
                
                VStack {
                    HStack {
                        Text("Score: \(scene.score)")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.white)
                            .shadow(color: .black.opacity(0.65), radius: 5, y: 5)
                        
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
                .padding()
                .padding(.horizontal, 25)
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Text("\(time.hour):\(time.minute)")
                            .font(.title)
                            .foregroundStyle(.white)
                            .padding(10)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundStyle(.ultraThinMaterial)
                                    .frame(minWidth: reader.frame(in: .global).width * 0.15)
                                    .shadow(color: .black.opacity(0.65), radius: 5, y: 5)
                            }
                        
                        Spacer()
                        
                        Button {
                            scene.pausePlayDidTapped()
                        } label: {
                            Image(systemName: scene.isScenePaused ? "play.fill" : "pause.fill")
                                .font(.largeTitle)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .ignoresSafeArea(.all)
            
            if scene.isScenePaused {
                PauseMenu()
            }
        }
    }
}

#Preview {
    GameView()
}
