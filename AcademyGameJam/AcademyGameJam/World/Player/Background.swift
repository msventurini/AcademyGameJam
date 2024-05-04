import SpriteKit

class BackgroundNode: SKSpriteNode {
    
    init(imageNamed imageName: String, size: CGSize) {
        let texture = SKTexture(imageNamed: imageName)
        super.init(texture: texture, color: .clear, size: size)
        
        self.position = CGPoint(x: size.width / 2, y: size.height / 2)
        self.zPosition = -1 // Certifica-se de que o fundo esteja atrás de outros elementos da cena
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
