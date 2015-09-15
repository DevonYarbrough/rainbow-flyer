

import SpriteKit

class Coin: SKSpriteNode, GameSprite {
    var textureAtlas:SKTextureAtlas = SKTextureAtlas(named:"goods.atlas")
    var value = 1
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize = CGSize(width: 26, height: 26)) {
        parentNode.addChild(self)
        self.size = size
        self.position = position
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width/2)
        self.physicsBody?.affectedByGravity = false
        self.texture = textureAtlas.textureNamed("coin_1.png")
    }
    
    func turnToBronze() {
        self.texture = textureAtlas.textureNamed("coin-bronze.png")
        self.value = 5
    }

    func onTap() {}
}