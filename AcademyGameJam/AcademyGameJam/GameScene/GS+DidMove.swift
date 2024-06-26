//
//  WS+DidMove.swift
//  AcademyGameJam
//
//  Created by Gustavo Zahorcsak Matias Silvano on 04/05/24.
//

import Foundation
import SpriteKit

extension GameScene {
    
    override func didMove(to view: SKView) {
        
        //MARK: - PHYSICS WORLD SETUP
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
        
        //MARK: - SCENE SETUP
        self.backgroundColor = UIColor.clear
        self.scaleMode = .aspectFill
        
        let center = CGPoint.init(x: view.bounds.midX, y: view.bounds.midY)
        
        //MARK: - CREATES VIRTUAL CONTROLLERS
        setupVirtualController()
        
        //MARK: - ADD MAP
        setupMap()
        addBoundaries()
        
        //MARK: - ADD TREES
        setupTrees(center: center)
        
        //MARK: - ADD FLOWERS
        setupFlowers()
        
        //MARK: - PLAYER
        setupPlayer()
        
        //MARK: - POLLUTION ENEMY
        addPollution()
        
        //MARK: - Cria e adiciona a câmera
        cameraNode = SKCameraNode()
        if let camera = cameraNode {
            self.camera = camera // Define a câmera da cena como a câmera que acabamos de criar
            addChild(camera)
        }
        
        cancelUpdaters()
        addUpdaters()
    }
}
