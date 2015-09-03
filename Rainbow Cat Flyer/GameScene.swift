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
    var screenCenterY = CGFloat()
    
    //keep track of progress
    let initialPlayerStart = CGPoint(x: 150, y: 250)
    var catProgress = CGFloat()
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor(red: 0.0, green: 0.3, blue: 0.56, alpha: 1.0)
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
        let groundPosition = CGPoint(x: -self.size.width, y: 30)
        let groundSize = CGSize(width: self.size.width * 3, height: 0)
        ground.spawn(world, position: groundPosition, size: groundSize)
        player.spawn(world, position: initialPlayerStart)
        // Set gravity
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -5)
        //Find vertical center de la screen
        screenCenterY = self.size.height / 2
    }
    
    override func didSimulatePhysics() {
        var worldYPos:CGFloat = 0
        //Zoom as cat flies up
        if (player.position.y > screenCenterY) {
            let percentOfMaxHeight = (player.position.y - screenCenterY) / (player.maxHeight - screenCenterY)
            let scaleSubtraction = (percentOfMaxHeight > 1 ? 1:percentOfMaxHeight) * 0.6
            let newScale = 1 - scaleSubtraction
            world.yScale = newScale
            world.xScale = newScale
            //adjust world
            worldYPos = -(player.position.y * world.yScale - (self.size.height) / 2)
        }
        
        //keep track of distance flown
        catProgress = player.position.x - initialPlayerStart.x
        
        let worldXPos = -(player.position.x * world.xScale - (self.size.width) / 3)
        //move world
        world.position = CGPoint(x: worldXPos, y:worldYPos)
        
        //See if ground should move
        ground.checkForReposition(catProgress)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch in (touches as! Set<UITouch>) {
            //find touch location
            let location = touch.locationInNode(self)
            let nodeTouched = nodeAtPoint(location)
            if let gameSprite = nodeTouched as? GameSprite {
                gameSprite.onTap()
            }
            player.startFlapping()
        }
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        player.stopFlapping()
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        player.stopFlapping()
    }
    
    override func update(currentTime: NSTimeInterval) {
        player.update()
    }
    
}