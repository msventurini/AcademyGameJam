//
//  MusicController.swift
//  AcademyGameJam
//
//  Created by Filipe Ilunga on 05/05/24.
//
import Foundation
import AVFoundation

final class MusicController: ObservableObject {
    
    var player: AVAudioPlayer?

    var volume: Float = 0.5 {
        didSet {
            player?.volume = volume
            if volume == 0 {
                isPlaying = false
            } else {
                isPlaying = true
            }
        }
    }
    
    let sound = Bundle.main.path(forResource: "backgroundmusic", ofType: "mp3")
    
    @Published var isPlaying: Bool = true {
        didSet {
            if isPlaying {
                playSound()
            } else {
                pauseSound()
            }
        }
    }
    
    init() {
        initSound()
    }
    
    func initSound() {
        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        playSound()
        player?.numberOfLoops = -1
        player?.volume = volume
    }
    
    func playSound() {
        player?.play()
    }
    
    func pauseSound() {
        player?.pause()
    }
}
