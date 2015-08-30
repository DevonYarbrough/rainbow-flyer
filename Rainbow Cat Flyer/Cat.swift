//
//  cat.swift
//  Rainbow Cat Flyer
//
//  Created by Devon Yarbrough on 8/29/15.
//  Copyright (c) 2015 Devonyarbrough.com. All rights reserved.
//

import SpriteKit

//create the cat 
class Cat: SKSpriteNode, GameSprite {
    var textureAtlas:SKTextureAtlas = SKTextureAtlas(named: "catchar.atlas")
    var flyAnimation = SKAction()
    
    //place cat into world 
    func spawn(parentNode:SKNode, position:CGPoint, size: CGSize = CGSize(width: 60, height: 34)) {
        parentNode.addChild(self)
        createAnimations()
        self.size = size
        self.position = position
        self.runAction(flyAnimation)
    }
    
    func createAnimations() {
        let flyFrames:[SKTexture] = [textureAtlas.textureNamed("frame-1.png"), textureAtlas.textureNamed("frame-2.png")]
        let flyAction = SKAction.animateWithTextures(flyFrames, timePerFrame: 0.14)
        flyAnimation = SKAction.repeatActionForever(flyAction)
    }
    
    func onTap() {}
}