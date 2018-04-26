//
//  GameScene.swift
//  IOS FINAL
//
//  Created by Rodrigues Isaac on 4/5/18.
//  Copyright © 2018 Rodrigues Isaac. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player:SKSpriteNode!
    var player2:SKSpriteNode!
    
    var initialPlayerPosition:CGPoint!
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let maximumPossibleForce = touch.maximumPossibleForce
            let force = touch.force
            let normalizedForce = force/maximumPossibleForce
            
            player.position.x = (self.size.width / 2) + normalizedForce * (self.size.width / 2 - 25)
            player2.position.x = (self.size.width / 2) - normalizedForce * (self.size.width / 2 - 25)
            
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let particlePath = Bundle.main.path(forResource: "MyParticle", ofType: "sks")!
                let particle = NSKeyedUnarchiver.unarchiveObject(withFile: particlePath) as! SKEmitterNode
                particle.name = "TheParticle"
                particle.position = touchLocation
                particle.targetNode = self
                
                addChild(particle)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        resetPlayerPosition()
    }
    
    func resetPlayerPosition() {
        player.position = initialPlayerPosition
        player2.position = initialPlayerPosition
    }
    
    override func didMove(to view: SKView) {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
        addPlayer()
        //addRow(type: RowType.twoS)
    }
    
    func addRandomRow() {
        //let randomRow = Int(arc4random_uniform(6))
        
        //switch randomRow {
        //case 0:
            //addRow(type: RowType(rawValue: 0)!)
            //break
        //case 1:
            //addRow(type: RowType(rawValue: 1)!)
            //break
        //case 2:
            //addRow(type: RowType(rawValue: 2)!)
            //break
        //case 3:
            //addRow(type: RowType(rawValue: 3)!)
            //break
        //case 4:
            //addRow(type: RowType(rawValue: 4)!)
            //break
        //case 5:
            //addRow(type: RowType(rawValue: 5)!)
            //break
        //default:
            //break
        //}
        
        let randomNumber = Int(arc4random_uniform(6))
        addRow(type: RowType(rawValue: randomNumber)!)
    }
    
    var lastUpdateInterval = TimeInterval()
    var lastYieldTimeInterval = TimeInterval()
    
    func updateWithtimeSinceLastUpdate(timeSinceLastUpdate: TimeInterval) {
        lastYieldTimeInterval += timeSinceLastUpdate
        if lastYieldTimeInterval > 0.6 {
            lastYieldTimeInterval = 0
            addRandomRow()
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        var timeSinceLastUpdate = currentTime - lastUpdateInterval
        lastUpdateInterval = currentTime
        
        if timeSinceLastUpdate > 1 {
            timeSinceLastUpdate = 1/60
            lastUpdateInterval = currentTime
        }
        
        updateWithtimeSinceLastUpdate(timeSinceLastUpdate: timeSinceLastUpdate)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "Player" {
            print("Game Over")
            showGameOver()
        }
    }
    
    func showGameOver() {
        let transition = SKTransition.fade(withDuration: 0.5)
        let gameOverScene = GameOverScene(size: self.size)
        self.view?.presentScene(gameOverScene, transition: transition)
    }
}
