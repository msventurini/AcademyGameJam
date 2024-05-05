//
//  GS+Tree.swift
//  AcademyGameJam
//
//  Created by Leandro Silva on 04/05/24.
//

import Foundation
import SpriteKit

extension GameScene{
    internal func setupTrees(center: CGPoint) {
        for i in 0..<settings.tree.quantity + 1{
            let tree = TreeNode(size: settings.tree.size)
            var point: CGPoint = .zero
            
            if i == 0 {
                let tree1 = CGPoint(x: center.x + 1500 + randomNumber(), y: center.y + 1700 + randomNumber() )
                
                point = tree1
                //let nodes = self.nodes(at: point)
                
                tree.position = point
                addChild(tree)
                continue
            }
            if i == 1{
                let tree2 = CGPoint(x: center.x + 1600 + randomNumber(), y: center.y - 1700 + randomNumber())
                point = tree2
                //let nodes = self.nodes(at: point)
                
                tree.position = point
                addChild(tree)
                continue
            }
            if i == 2{
                let tree3 = CGPoint(x: center.x - 1500 + randomNumber(), y: center.y + 1700 + randomNumber())
                point = tree3
                //let nodes = self.nodes(at: point)
                
                tree.position = point
                addChild(tree)
                continue
            }
            if i == 3{
                let tree4 = CGPoint(x: center.x - 1500 + randomNumber(), y: center.y - 1700 + randomNumber())
                point = tree4
                //let nodes = self.nodes(at: point)
                
                tree.position = point
                addChild(tree)
            }
        }
    }
    //gera um numero aletório entre -100 e 100
    func randomNumber() -> CGFloat {
        return CGFloat.random(in: -100...100)
    }
}
