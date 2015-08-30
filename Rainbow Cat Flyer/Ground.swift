//
//  Ground.swift
//  Rainbow Cat Flyer
//
//  Created by Devon Yarbrough on 8/30/15.
//  Copyright (c) 2015 Devonyarbrough.com. All rights reserved.
//

import SpriteKit

class Ground:SKSpriteNode, GameSprite {
    var textureAtlas:SKTextureAtlas = SKTextureAtlas(named: "ground.atlas")
    var groundTexture:SKTexture?
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize) {
        parentNode.addChild(self)
        self.size = size
        self.position = position
        
        //Change the anchor point so ground is just above bottom of screen
        self.anchorPoint = CGPointMake(0, 1)
        
        //Default to green
        if groundTexture == nil {
            groundTexture = textureAtlas.textureNamed("grass.png")
        }
        
        //make child nodes to repeat texture
        createChildren()
        //add the physics
        let pointTopRight =  CGPoint(x: size.width, y: 0)
        self.physicsBody = SKPhysicsBody(edgeFromPoint: CGPointZero, toPoint: pointTopRight)
    }
    
    func createChildren() {
        if let texture = groundTexture {
            var tileCount:CGFloat = 0
            let textureSize = texture.size()
            //for retina
            let tileSize = CGSize(width: textureSize.width / 2, height: textureSize.height / 2)
            //cover entire bottom
            while tileCount * tileSize.width < self.size.width {
                let tileNode = SKSpriteNode(texture: texture)
                tileNode.size = tileSize
                tileNode.position.x = tileCount * tileSize.width
                tileNode.anchorPoint = CGPoint(x: 0, y: 1)
                self.addChild(tileNode)
                tileCount++
            }
        }
    }
    func onTap() {}
}
