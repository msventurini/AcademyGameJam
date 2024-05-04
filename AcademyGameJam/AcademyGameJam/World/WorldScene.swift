import Foundation
import SpriteKit
import GameController

class WorldScene: SKScene {
    
    var virtualController: GCVirtualController? //Controllers
    var player: Player? // Adicione uma propriedade para armazenar o jogador
    var background: BackgroundNode? // Adicione uma propriedade para armazenar o fundo
    var cameraNode: SKCameraNode? // Propriedade para a câmera
    
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
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
    
    override func update(_ currentTime: TimeInterval) {
        if let player = player {
            cameraNode?.position = player.position
        }
        
        actionVirtualButtons()
    }
}
