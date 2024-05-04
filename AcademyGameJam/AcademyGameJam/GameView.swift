//
//  ContentView.swift
//  WorldGame
//
//  Created by Gustavo Diefenbach on 01/09/23.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    var scene: WorldScene = WorldScene(size: CGSize(width: 300, height: 300))
                                       
    var body: some View {
        ZStack {
            SpriteView(scene: scene)
        }
        .ignoresSafeArea(.all)
    }
    
}

#Preview {
    GameView()
}
