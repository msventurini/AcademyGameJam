//
//  SKNode+AnimationExtension.swift
//  AcademyGameJam
//
//  Created by Matheus Silveira Venturini on 05/05/24.
//

import Foundation
import SpriteKit

extension SKSpriteNode {
    func loadTextures(atlas: String, prefix: String, startsAt: Int, stopsAt: Int) -> [SKTexture] {
        let textureAtlas = SKTextureAtlas(named: atlas)
        
        var textureArray = [SKTexture]()
        for i in startsAt...stopsAt {
            let textureName = "\(prefix)\(i)"
            let temp = textureAtlas.textureNamed(textureName)
            textureArray.append(temp)
        }
        
        return textureArray
    }
}
