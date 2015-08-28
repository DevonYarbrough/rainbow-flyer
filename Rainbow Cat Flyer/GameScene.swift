//
//  Rainbow Cat Flyer
//  Created by Devon Yarbrough on 8/24/15.
//  Copyright (c) 2015 Devonyarbrough.com. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        let cat = SKSpriteNode(imageNamed: "nyan.png")
        cat.size = CGSize(width: 170, height: 100)
        cat.position = CGPoint(x: 250, y: 250)
        self.addChild(cat)
    }
}