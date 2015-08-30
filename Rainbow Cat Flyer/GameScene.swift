//
//  Rainbow Cat Flyer
//  Created by Devon Yarbrough on 8/24/15.
//  Copyright (c) 2015 Devonyarbrough.com. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    //create the world
    let world = SKNode()
    //create cat
    let cat = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        //add world node into scene
        self.addChild(world)
        //call new cat function
        self.addTheFlyingCat()
        //create more Cats
        let cat1 = Cat()
        let cat2 = Cat()
        let cat3 = Cat()
        cat1.spawn(world, position: CGPoint(x: 325, y: 325))
        cat2.spawn(world, position: CGPoint(x: 200, y: 325))
        cat3.spawn(world, position: CGPoint(x: 50, y: 200))
    }
    
    func addTheFlyingCat() {
        //create our cat
        cat.size = CGSize(width: 85, height: 50)
        cat.position = CGPoint(x: 250, y: 250)
        world.addChild(cat)
        //add the texture
        let catAtlas = SKTextureAtlas(named: "catchar.atlas")
        let catFrames:[SKTexture] = [
        catAtlas.textureNamed("frame-1.png"),
        catAtlas.textureNamed("frame-2.png"),
        catAtlas.textureNamed("frame-3.png"),
        ]
        //animate the frames
        let flyAction = SKAction.animateWithTextures(catFrames, timePerFrame: 0.14)
        let catAction = SKAction.repeatActionForever(flyAction)
        //run repeat action
        cat.runAction(catAction)
    }
    
    override func didSimulatePhysics() {
        //center the cat
        let worldXPos = -(cat.position.x * world.xScale - (self.size.width / 2))
        let worldYPos = -(cat.position.y * world.yScale - (self.size.height / 2))
        world.position = CGPoint(x: worldXPos, y: worldYPos)
    }
}