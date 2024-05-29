import Foundation
import GameKit
import Combine
import SpriteKit
import GameController

class GameScene: SKScene, SKPhysicsContactDelegate, ObservableObject {
    
    @Published var timer: Int = 180 // Tempo de jogo
    @Published var score: Float = 0
    @Published var isScenePaused = false
    @Published var pollen: Float = 0
    @Published var isGameOver = false

    let settings: GameSettings = .init(
        flower: .init(quantity: 500, size: .init(width: 40, height: 40), pollenMultiplier: 50),
        map: .init(map: 200, tile: 25, tilePollenRange: 50..<250),
        tree: .init(size: .init(width: 100, height: 100), numberOfFlowersAround: 10, flowerRadius: 100, flowerRadiusRandomRange: 0..<101),
        player: .init(movementSpeed: 5, pollenDisperseRate: 2),
        score: .init(basePoints: 0.5),
        bird: .init(size: .init(width: 40, height: 30), movementSpeed: 15, knockbackForce: 50, approachBeforeAttackRadius: 50)
    )
    
    var virtualController: GCVirtualController? //Controllers
    var player: Player? // Adicione uma propriedade para armazenar o jogador
    var enemies: [EnemyTypes:[SKSpriteNode]] = [:]
    var cameraNode: SKCameraNode? // Propriedade para a câmera
    var cancellables: Set<AnyCancellable> = Set<AnyCancellable>() // Guarda todos os updaters canceláveis
    
    var map: MapNode?
    var bounds: CGRect = .zero
    
    var birdSpawnnerChance: CGFloat = 0.1
    
    lazy var pollenEmitter: SKEmitterNode = {
        let emitter = SKEmitterNode(fileNamed: "PollenTrail") ?? SKEmitterNode()
        emitter.name = "PollenTrail"
        emitter.targetNode = self
        emitter.alpha = 0
        
        return emitter
    }()
    
    var interactables: [SKNode] = []
    var isInteracting: Bool = false
    
    override var isPaused: Bool { // Cancelar todos os updaters quando for pausar o jogo (e adicionar de novo dps)
        didSet {
            isScenePaused = isPaused
            if oldValue == isPaused { return }
            
            if isPaused {
                cancelUpdaters()
            } else {
                addUpdaters()
            }
        }
    }
    
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
        
        let location = convertPoint(fromView: viewLocation)
        
        print("tap", location)
    }
}
