//
//  cat.swift
//  Rainbow Cat Flyer
//
//  Created by Devon Yarbrough on 8/29/15.
//  Copyright (c) 2015 Devonyarbrough.com. All rights reserved.
//

import SpriteKit

//create the cat 
class Bee: SKSpriteNode, GameSprite {
    var textureAtlas:SKTextureAtlas = SKTextureAtlas(named: "enemies.atlas")
    var flyAnimation = SKAction()
    
    //place bee into world
    func spawn(parentNode:SKNode, position:CGPoint, size: CGSize = CGSize(width: 28, height: 24)) {
        parentNode.addChild(self)
        createAnimations()
        self.size = size
        self.position = position
        self.runAction(flyAnimation)
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width/2)
        self.physicsBody?.affectedByGravity = false
    }
    
    func createAnimations() {
        let flyFrames:[SKTexture] = [textureAtlas.textureNamed("bee.png"), textureAtlas.textureNamed("bee_fly.png")]
        let flyAction = SKAction.animateWithTextures(flyFrames, timePerFrame: 0.14)
        flyAnimation = SKAction.repeatActionForever(flyAction)
    }
    
    func onTap() {}
}