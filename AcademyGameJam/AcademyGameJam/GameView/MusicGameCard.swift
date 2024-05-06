//
//  MusicGameCard.swift
//  AcademyGameJam
//
//  Created by Filipe Ilunga on 05/05/24.
//

import Foundation
import SwiftUI

struct MusicGameCard: View {
    
    @EnvironmentObject var soundManager: MusicController

    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 12) {
                Text("Music")
                    .fontWeight(.bold)
                    .font(.system(size: 38))
                    .padding(.top, 50)
                    .foregroundColor(.white)
                VStack(spacing: 0) {
                    
                    
                    Image(systemName: iconLabel())
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                        .frame(width: 60, height: 60)
                        .background(
                            Circle()
                                .foregroundColor(.white)
                        )
                        .onTapGesture {
                            withAnimation {
                                if soundManager.isPlaying {
                                    soundManager.pauseSound()
                                } else {
                                    soundManager.playSound()
                                }
                                soundManager.isPlaying.toggle()
                            }
                        }
                    
                    
                    Text(soundManager.isPlaying ? "on": "off")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    
                }.padding(.bottom, 12)
                HStack {
                    Image(systemName: "speaker.wave.1")
                    Slider(value: $soundManager.volume, in: 0.0...1.0)
                        .padding(.horizontal)
                        .tint(soundManager.isPlaying ? Color.green : Color.gray)
                    Image(systemName: "speaker.wave.3")
                }.padding(.horizontal, 20)
                
                Spacer()
            }
            .frame(maxWidth: UIScreen.main.bounds.width * 0.5, maxHeight: UIScreen.main.bounds.height * 0.80)
            .background(Color.green.opacity(0.4))
            .cornerRadius(12)
        }
    }
    
    func iconLabel() -> String {
        guard soundManager.isPlaying else {
            return "speaker.slash"
        }
        switch soundManager.volume {
        case 0.0:
            return "speaker.slash"
        case 0.0001..<0.3:
            return "speaker.wave.1"
        case 0.3..<0.8:
            return "speaker.wave.2"
        case 0.8..<1:
            return "speaker.wave.3"
        default:
            return "speaker.wave.3"
        }
    }
    
}

