//
//  GameScene.swift
//  Project11
//
//  Created by Nick on 2019/5/5.
//  Copyright © 2019 Nick. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var scoreLabel: SKLabelNode!
    var score = 0 {
        didSet {
            scoreLabel.text = "score: \(score)"
        }
    }
    
    var editLabel: SKLabelNode!
    var editingMode = false {
        didSet {
            if editingMode == true {
                editLabel.text = "Done"
            } else {
                editLabel.text = "Edit"
            }
        }
    }
    
    var balls = ["ballRed", "ballBlue", "ballCyan", "ballGreen", "ballYellow", "ballPurple"]
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background.jpg", normalMapped: true)
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.text = "score: 0"
        scoreLabel.position = CGPoint(x: 900, y: 700)
        addChild(scoreLabel)
        
        editLabel = SKLabelNode(fontNamed: "Chalkduster")
        editLabel.text = "Edit"
        editLabel.position = CGPoint(x: 80, y: 700)
        addChild(editLabel)
        
        makeSlot(position: CGPoint(x: 128, y: 0), isGood: true)
        makeSlot(position: CGPoint(x: 384, y: 0), isGood: false)
        makeSlot(position: CGPoint(x: 640, y: 0), isGood: true)
        makeSlot(position: CGPoint(x: 896, y: 0), isGood: false)
        
        addBouncer(position: CGPoint(x: 0, y: 0))
        addBouncer(position: CGPoint(x: 256, y: 0))
        addBouncer(position: CGPoint(x: 512, y: 0))
        addBouncer(position: CGPoint(x: 768, y: 0))
        addBouncer(position: CGPoint(x: 1024, y: 0))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let position = touch.location(in: self)
        
        guard position.y > 650 else { return }
        
        let objects = nodes(at: position)
        if objects.contains(editLabel) {
            editingMode.toggle()
        } else {
            if editingMode {
                let size = CGSize(width: Int.random(in: 16...128), height: 16)
                let box = SKSpriteNode(color: UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1), size: size)
                box.zRotation = CGFloat.random(in: 0...3)
                box.position = position
                
                box.physicsBody = SKPhysicsBody(rectangleOf: box.size)
                box.physicsBody?.isDynamic = false
                
                addChild(box)
            } else {
                guard let randomBall = balls.randomElement() else { return }
                let ball = SKSpriteNode(imageNamed: randomBall)
                ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width * 0.5)
                ball.physicsBody?.restitution = 0.4
                ball.physicsBody!.contactTestBitMask = ball.physicsBody!.collisionBitMask
                ball.name = "ball"
                ball.position = position
                addChild(ball)
            }
        }
    }
    
    func addBouncer(position: CGPoint) {
        let bouncer = SKSpriteNode(imageNamed: "bouncer")
        bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width * 0.5)
        bouncer.physicsBody?.restitution = 0.4
        bouncer.physicsBody?.isDynamic = false // 不设置为fale，会滚动
        bouncer.position = position
        addChild(bouncer)
    }
    
    func makeSlot(position: CGPoint, isGood: Bool) {
        var slotBase: SKSpriteNode
        var slotGlow: SKSpriteNode
        if isGood {
            slotBase = SKSpriteNode(imageNamed: "slotBaseGood")
            slotGlow = SKSpriteNode(imageNamed: "slotGlowGood")
            slotBase.name = "good"
        } else {
            slotBase = SKSpriteNode(imageNamed: "slotBaseBad")
            slotGlow = SKSpriteNode(imageNamed: "slotGlowBad")
            slotBase.name = "bad"
        }
        
        
        slotBase.physicsBody = SKPhysicsBody(rectangleOf: slotBase.size)
        slotBase.physicsBody?.isDynamic = false
        
        slotBase.position = position
        slotGlow.position = position
        addChild(slotBase)
        addChild(slotGlow)
        
        let spin = SKAction.rotate(byAngle: .pi, duration: 10)
        let forever = SKAction.repeatForever(spin)
        slotGlow.run(forever)
    }
    
    func collisionBetween(ball: SKNode, object: SKNode) {
        if object.name == "good" {
            destroy(ball: ball)
            score += 1
        } else if object.name == "bad" {
            destroy(ball: ball)
            score -= 1
        }
    }
    
    func destroy(ball: SKNode) {
        
        if let fire = SKEmitterNode(fileNamed: "FireParticles") {
            fire.position = ball.position
            addChild(fire)
        }
        
        ball.removeFromParent()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        if nodeA.name == "ball" {
            collisionBetween(ball: nodeA, object: nodeB)
        } else if nodeB.name == "ball" {
            collisionBetween(ball: nodeB, object: nodeA)
        }
    }
}
