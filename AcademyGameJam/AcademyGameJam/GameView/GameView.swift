//
//  ContentView.swift
//  WorldGame
//
//  Created by Gustavo Diefenbach on 01/09/23.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var soundManager: MusicController
    
    @StateObject private var scene: GameScene = GameScene()

    @State private var started = false
    
    @Binding var shouldRestart: Bool
    
    var time: (hour: String, minute: String) {
        let time = scene.timer.quotientAndRemainder(dividingBy: 60)
        
        return (hour: time.quotient > 9 ? "\(time.quotient)" : "0\(time.quotient)",
                minute: time.remainder > 9 ? "\(time.remainder)" : "0\(time.remainder)")
    }
    
    var body: some View {
        GeometryReader { reader in
            SpriteView(scene: scene)
                .onAppear {
                    scene.size = reader.size
                }
            
            VStack {
                HStack {
                    Text("Score: \(Int(scene.score))")
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
                }
                
                Spacer()
            }
            .padding()
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        scene.togglePause()
                    } label: {
                        Image(systemName: "pause.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(10)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundStyle(.ultraThinMaterial)
                                    .shadow(color: .black.opacity(0.45), radius: 5, y: 5)
                            }
                    }
                    .disabled(scene.isGameOver)
                }
            }
            .padding()
            .padding(.horizontal, 25)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    VStack(spacing: 20) {
                        HStack(spacing: 20) {
                            Button {
                                router.pop(toRoot: true)
                            } label: {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.green)
                                    .shadow(color: .black.opacity(0.45), radius: 5, y: 5)
                                    .overlay {
                                        Image(systemName: "xmark")
                                            .font(.title)
                                            .bold()
                                            .foregroundStyle(.white)
                                    }
                            }
                            .frame(width: reader.frame(in: .global).height * 0.2)
                            
                            Button {
                                shouldRestart = true
                            } label: {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.green)
                                    .shadow(color: .black.opacity(0.45), radius: 5, y: 5)
                                    .overlay {
                                        Image(systemName: "arrow.circlepath")
                                            .font(.title)
                                            .bold()
                                            .foregroundStyle(.white)
                                    }
                            }
                            .frame(width: reader.frame(in: .global).height * 0.2)
                            
                            Button {
                                scene.togglePause()
                            } label: {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.green)
                                    .shadow(color: .black.opacity(0.45), radius: 5, y: 5)
                                    .overlay {
                                        Image(systemName: "play.fill")
                                            .font(.title)
                                            .bold()
                                            .foregroundStyle(.white)
                                    }
                            }
                            .frame(width: reader.frame(in: .global).height * 0.2)
                        }
                        .frame(height: reader.frame(in: .global).height * 0.2)
                        .padding(.top)
                        
                        HStack {
                            Image(systemName: "speaker.wave.1")
                                .font(.title)
                            
                            Slider(value: $soundManager.volume, in: 0.0...1.0)
                                .padding(.horizontal)
                                .tint(soundManager.isPlaying ? Color.green : Color.gray)
                            
                            Image(systemName: "speaker.wave.3")
                                .font(.title)
                        }
                        .padding()
                    }
                    .frame(maxWidth: reader.frame(in: .global).width * 0.5)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .scaleEffect(scene.isScenePaused ? 1 : 0)
                    .animation(.easeInOut, value: scene.isScenePaused)
                    
                    Spacer()
                }
                
                Spacer()
            }
            
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    EndGameView(score: $scene.score, shouldRestart: $shouldRestart)
                        .scaleEffect(scene.isGameOver ? 1 : 0)
                        .animation(.easeInOut, value: scene.isGameOver)
                    
                    Spacer()
                }
                
                Spacer()
            }
        }
        .ignoresSafeArea(.all)
        .navigationBarBackButtonHidden()
        .onAppear {
            if !started {
                soundManager.playSound()
                started = true
            }
        }
    }
}

#Preview {
    NavigationStack {
        GameView(shouldRestart: .constant(false))
    }
    .environmentObject(MusicController())
    .environmentObject(Router())
}
