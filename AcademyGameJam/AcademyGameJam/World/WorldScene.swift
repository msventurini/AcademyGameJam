import Foundation
import SpriteKit
import GameController

class WorldScene: SKScene {
    
    var virtualController: GCVirtualController? //Controllers
    var player: Player? // Adicione uma propriedade para armazenar o jogador
    var cameraNode: SKCameraNode? // Propriedade para a câmera
    var background: BackgroundNode? // O mapa
    
    var bounds: CGRect = .zero
    
    let settings: GameSettings = .init(
        flower: .init(quantity: 2000, size: .init(width: 20, height: 20 * 0.8)),
        map: .init(map: 200, tile: 25)
    )
    
    override func didMove(to view: SKView) {
        self.scene?.size = view.bounds.size
        self.backgroundColor = .clear
        self.scaleMode = .aspectFill

        let center = CGPoint.init(x: view.bounds.midX, y: view.bounds.midY)
        
        //MARK: - CREATES VIRTUAL CONTROLLERS
        setupVirtualController()
        
        //MARK: - ADD BACKGROUND
        setupBackground(center: center)
        
        // MARK: - ADD FLOWERS
        setupFlowers()
        
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
