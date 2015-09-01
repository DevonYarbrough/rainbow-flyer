//
//  Player.swift
//  Rainbow Cat Flyer
//
//  Created by Devon Yarbrough on 8/30/15.
//  Copyright (c) 2015 Devonyarbrough.com. All rights reserved.
//

import SpriteKit

class Player : SKSpriteNode, GameSprite {
    var textureAtlas:SKTextureAtlas = SKTextureAtlas(named:"catchar.atlas")
    //animation for up and down
    var flyAnimation = SKAction()
    var soarAnimation = SKAction()
    
    func spawn(parentNode: SKNode, position: CGPoint, size:CGSize = CGSize(width:70, height:45)) {
        parentNode.addChild(self)
        createAnimations()
        self.size = size
        self.position = position
        self.runAction(flyAnimation, withKey: "flapAnimation")
        let bodyTexture = textureAtlas.textureNamed("frame-1.png")
        self.physicsBody = SKPhysicsBody(
            texture: bodyTexture,
            size: size)
        //lose momentum
        self.physicsBody?.linearDamping = 0.9
        self.physicsBody?.mass = 30
        //stop rotation
        self.physicsBody?.allowsRotation = false
    }
    
    func createAnimations() {
        let rotateUpAction = SKAction.rotateToAngle(0, duration: 0.475)
        rotateUpAction.timingMode = .EaseOut
        let rotateDownAction = SKAction.rotateToAngle(-1, duration: 0.8)
        rotateDownAction.timingMode = .EaseIn
        //flying animation
        let flyFrames:[SKTexture] = [
            textureAtlas.textureNamed("frame-1.png"),
            textureAtlas.textureNamed("frame-2.png"),
            textureAtlas.textureNamed("frame-3.png"),
            textureAtlas.textureNamed("frame-4.png"),
            textureAtlas.textureNamed("frame-5.png"),
            textureAtlas.textureNamed("frame-6.png"),
            textureAtlas.textureNamed("frame-7.png"),
            textureAtlas.textureNamed("frame-8.png"),
        ]
        let flyAction = SKAction.animateWithTextures(flyFrames, timePerFrame: 0.03)
        flyAnimation = SKAction.group([
            SKAction.repeatActionForever(flyAction),
            rotateUpAction
        ])
        //create soaring animation
        let soarFrames:[SKTexture] = [textureAtlas.textureNamed("frame-1.png")]
        let soarAction = SKAction.animateWithTextures(soarFrames, timePerFrame: 1)
        soarAnimation = SKAction.group([
        SKAction.repeatActionForever(soarAction),
        rotateDownAction
        ])
    }
    
    func update() { }
    
    func onTap() {}
}
