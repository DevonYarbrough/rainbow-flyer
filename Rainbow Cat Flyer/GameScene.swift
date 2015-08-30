//
//  Rainbow Cat Flyer
//  Created by Devon Yarbrough on 8/24/15.
//  Copyright (c) 2015 Devonyarbrough.com. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    //create the world
    let world = SKNode()
    //create the ground
    let ground = Ground()
    //create cat
    let player = Player()
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        //add world node into scene
        self.addChild(world)
        //create more bees
        let bee1 = Bee()
        let bee2 = Bee()
        let bee3 = Bee()
        bee1.spawn(world, position: CGPoint(x: 325, y: 325))
        bee2.spawn(world, position: CGPoint(x: 200, y: 325))
        bee3.spawn(world, position: CGPoint(x: 50, y: 200))
        //spawn the ground
        let groundPosition = CGPoint(x: -self.size.width, y: 100)
        let groundSize = CGSize(width: self.size.width * 3, height: 0)
        ground.spawn(world, position: groundPosition, size: groundSize)
        player.spawn(world, position: CGPoint(x: 150, y: 250))
    }
    
    override func didSimulatePhysics() {
        //center the cat
        let worldXPos = -(player.position.x * world.xScale - (self.size.width / 2))
        let worldYPos = -(player.position.y * world.yScale - (self.size.height / 2))
        world.position = CGPoint(x: worldXPos, y: worldYPos)
    }
}