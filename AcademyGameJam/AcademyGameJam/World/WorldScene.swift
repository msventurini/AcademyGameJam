import Foundation
import Combine
import SpriteKit
import GameController

class WorldScene: SKScene, SKPhysicsContactDelegate {
    
    var virtualController: GCVirtualController? //Controllers
    var player: Player? // Adicione uma propriedade para armazenar o jogador
    var background: BackgroundNode? // Adicione uma propriedade para armazenar o fundo
    var cameraNode: SKCameraNode? // Propriedade para a câmera
    var cancellables: Set<AnyCancellable> = Set<AnyCancellable>() // Guard todos os updaters canceláveis
    
    override var isPaused: Bool { // Cancelar todos os updaters quando for pausar o jogo (e adicionar de novo dps)
        didSet {
            if isPaused {
                cancelUpdaters()
            } else {
                addUpdaters()
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if let player = player {
            cameraNode?.position = player.position
        }
        actionVirtualButtons()
    }
}
