import Foundation
import SpriteKit
import GameController

class WorldScene: SKScene {
    
    var virtualController: GCVirtualController? //Controllers
    var player: Player? // Adicione uma propriedade para armazenar o jogador
    var background: BackgroundNode? // Adicione uma propriedade para armazenar o fundo
    var cameraNode: SKCameraNode? // Propriedade para a câmera
    
    override func didMove(to view: SKView) {
        self.scene?.size = view.bounds.size
        self.backgroundColor = .clear
        self.scaleMode = .aspectFill
        
        //MARK: - CREATES VIRTUAL CONTROLLERS
        setupVirtualController()
        
        //MARK: - ADD BACKGROUND
        let grid = GridNode(tileSize: .init(width: 25, height: 25), gridSize: (width: 200, height: 200))
        grid.position = .init(x: view.bounds.size.width/2 - grid.width/2, y: view.bounds.size.height/2 - grid.height/2)
        addChild(grid)
        
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
    
    override func update(_ currentTime: TimeInterval) {
        if let player = player {
            cameraNode?.position = player.position
        }
        
        actionVirtualButtons()
    }
}
