//
//  WS+DidMove.swift
//  AcademyGameJam
//
//  Created by Gustavo Zahorcsak Matias Silvano on 04/05/24.
//

import Foundation
import SpriteKit

extension WorldScene {
    
    override func didMove(to view: SKView) {
        
        //MARK: - PHYSICS WORLD SETUP
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
        
        //MARK: - SCENE SETUP
        self.backgroundColor = UIColor.clear
        
        //MARK: - CREATES VIRTUAL CONTROLLERS
        setupVirtualController()
        
        //MARK: - ADD BACKGROUND
        background = BackgroundNode(imageNamed: "background-test", size: size)
        if let background = background {
            addChild(background)
        }
        
        //MARK: - PLAYER
        player = Player()
        player?.position = CGPoint(x: size.width / 2, y: size.height / 2) //Center from screen
        
        if let playerNode = player {
            addChild(playerNode)
        }
        
        // MARK: - Cria e adiciona a câmera
        cameraNode = SKCameraNode()
        if let camera = cameraNode {
            self.camera = camera // Define a câmera da cena como a câmera que acabamos de criar
            addChild(camera)
        }
    }
}
