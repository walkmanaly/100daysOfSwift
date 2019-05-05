//
//  GameScene.swift
//  Project11
//
//  Created by Nick on 2019/5/5.
//  Copyright © 2019 Nick. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background.jpg", normalMapped: true)
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let position = touch.location(in: self)
        
        let box = SKSpriteNode(color: .orange, size: CGSize(width: 64, height: 64))
        
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 64, height: 64))
        box.position = position
        addChild(box)
    }
}
