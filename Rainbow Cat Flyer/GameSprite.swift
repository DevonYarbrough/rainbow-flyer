//
//  GameSprite.swift
//  Rainbow Cat Flyer
//
//  Created by Devon Yarbrough on 8/29/15.
//  Copyright (c) 2015 Devonyarbrough.com. All rights reserved.
//

import SpriteKit

protocol GameSprite {
    var textureAtlas: SKTextureAtlas { get set }
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize)
    func onTap()
}
