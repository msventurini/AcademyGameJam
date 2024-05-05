import Foundation
import Combine
import SpriteKit
import GameController

class GameScene: SKScene, SKPhysicsContactDelegate, ObservableObject {
    
    @Published var timer: Int = 300 // Tempo de jogo
    @Published var score: Int = 0

    let settings: GameSettings = .init(
        flower: .init(quantity: 1000, size: .init(width: 40, height: 40 * 0.8)),
        map: .init(map: 200, tile: 25),
        tree: .init(size: .init(width: 100, height: 100)),
        player: .init(movementSpeed: 5)
    )
    
    var virtualController: GCVirtualController? //Controllers
    var player: Player? // Adicione uma propriedade para armazenar o jogador
    var cameraNode: SKCameraNode? // Propriedade para a câmera
    var cancellables: Set<AnyCancellable> = Set<AnyCancellable>() // Guarda todos os updaters canceláveis    
    
    var map: MapNode?
    var bounds: CGRect = .zero
    
    var interactable: SKNode?
    
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
        if let player = player,
           let camera = cameraNode,
           let scene = scene {
            
            if player.position.x - scene.size.width/2 > bounds.minX && player.position.x + scene.size.width/2 < bounds.maxX {
                camera.position.x = player.position.x
            }
            
            if player.position.y - scene.size.height/2 > bounds.minY && player.position.y + scene.size.height/2 < bounds.maxY {
                camera.position.y = player.position.y
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let viewLocation = touches.first?.location(in: view) else { return }
        
        let sceneLocation = convertPoint(fromView: viewLocation)
        print(nodes(at: sceneLocation).map(\.name))
    }
}
