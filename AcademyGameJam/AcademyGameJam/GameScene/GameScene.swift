import Foundation
import Combine
import SpriteKit
import GameController

class GameScene: SKScene, SKPhysicsContactDelegate, ObservableObject {
    
    @Published var timer: Int = 300 // Tempo de jogo
    @Published var score: Int = 0

    var virtualController: GCVirtualController? //Controllers
    var player: Player? // Adicione uma propriedade para armazenar o jogador
    var cameraNode: SKCameraNode? // Propriedade para a câmera
    var cancellables: Set<AnyCancellable> = Set<AnyCancellable>() // Guarda todos os updaters canceláveis    
    
    var map: MapNode?
    
    var bounds: CGRect = .zero
        
    let settings: GameSettings = .init(
        flower: .init(quantity: 2000, size: .init(width: 20, height: 20 * 0.8)),
        map: .init(map: 200, tile: 25)
    )
    
    
    override var isPaused: Bool { // Cancelar todos os updaters quando for pausar o jogo (e adicionar de novo dps)
        didSet {
            if oldValue == isPaused { return }
            
            if isPaused {
                cancelUpdaters()
            } else {
                addUpdaters()
            }
        }
    }
    
//    override func update(_ currentTime: TimeInterval) {
//        actionVirtualButtons()
//    }
    
    override func didFinishUpdate() {
        if let player = player {
            cameraNode?.position = player.position
        }
    }
}
