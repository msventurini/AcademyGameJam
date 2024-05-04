import Foundation
import Combine
import SpriteKit
import GameController

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var virtualController: GCVirtualController? //Controllers
    var player: Player? // Adicione uma propriedade para armazenar o jogador
    var cameraNode: SKCameraNode? // Propriedade para a câmera
    var cancellables: Set<AnyCancellable> = Set<AnyCancellable>() // Guarda todos os updaters canceláveis
    var timer: Int = 0 // Tempo de jogo
    
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
        actionVirtualButtons()
    }
    
    override func didFinishUpdate() {
        if let player = player {
            cameraNode?.position = player.position
        }
    }
}
