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
        
        let bouncer = SKSpriteNode(imageNamed: "bouncer")
        bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width * 0.5)
        bouncer.physicsBody?.restitution = 0.4
        bouncer.physicsBody?.isDynamic = false // 不设置为fale，会滚动
        bouncer.position = CGPoint(x: 512, y: 0)
        addChild(bouncer)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let position = touch.location(in: self)
        
        let ball = SKSpriteNode(imageNamed: "ballRed")
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width * 0.5)
        ball.physicsBody?.restitution = 0.4
        ball.position = position
        addChild(ball)
    }
}
