//
//  ContentView.swift
//  WorldGame
//
//  Created by Gustavo Diefenbach on 01/09/23.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    var scene: GameScene = GameScene()
                                   
    var body: some View {
        GeometryReader { reader in
            SpriteView(scene: scene, debugOptions: [.showsPhysics, .showsFPS, .showsNodeCount])
                .onAppear {
                    scene.size = reader.size
                }
        }
        .ignoresSafeArea(.all)
    }
    
}

#Preview {
    GameView()
}
