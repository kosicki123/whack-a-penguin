//
//  GameScene.swift
//  whack-a-penguin
//
//  Created by Renan Kosicki on 9/21/15.
//  Copyright (c) 2015 Renan Kosicki. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var gameScore: SKLabelNode!
    var slots = [WhackSlot]()

    var score: Int = 0 {
        didSet {
            gameScore.text = "Score: \(score)"
        }
    }
    
    override func didMoveToView(view: SKView) {
        let background = SKSpriteNode(imageNamed: "whackBackground")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .Replace
        background.zPosition = -1
        addChild(background)
        
        gameScore = SKLabelNode(fontNamed: "Chalkduster")
        gameScore.text = "Score: 0"
        gameScore.position = CGPoint(x: 8, y: 8)
        gameScore.horizontalAlignmentMode = .Left
        gameScore.fontSize = 48
        addChild(gameScore)
        
        for i in 0 ..< 5 { createSlotAt(CGPoint(x: 100 + (i * 170), y: 410)) }
        for i in 0 ..< 4 { createSlotAt(CGPoint(x: 180 + (i * 170), y: 320)) }
        for i in 0 ..< 5 { createSlotAt(CGPoint(x: 100 + (i * 170), y: 230)) }
        for i in 0 ..< 4 { createSlotAt(CGPoint(x: 180 + (i * 170), y: 140)) }
    }

    func createSlotAt(pos: CGPoint) {
        let slot = WhackSlot()
        slot.configureAtPosition(pos)
        addChild(slot)
        slots.append(slot)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
