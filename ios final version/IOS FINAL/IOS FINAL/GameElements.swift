//
//  GameElements.swift
//  IOS FINAL
//
//  Created by Rodrigues Isaac on 4/5/18.
//  Copyright © 2018 Rodrigues Isaac. All rights reserved.
//

import SpriteKit

struct CollisionBitMask {
    static let Player:UInt32 = 0x00
    static let Obstacle:UInt32 = 0x01 
}

enum ObstacleType:Int {
    case small = 0
    case medium = 1
    case large = 2
}

enum RowType:Int {
    case oneS = 0
    case oneM = 1
    case oneL = 2
    case twoS = 3
    case twoM = 4
    case threeS = 5
}

extension GameScene {
    
    func addPlayer() {
        player = SKSpriteNode(color: UIColor.white, size: CGSize(width: 20, height: 20))
        player.position = CGPoint(x: self.size.width / 2, y: 350)
        player.name = "Player"
        player.physicsBody?.isDynamic = false
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.categoryBitMask = CollisionBitMask.Player
        player.physicsBody?.collisionBitMask = 0
        player.physicsBody?.contactTestBitMask = CollisionBitMask.Obstacle
        
        player2 = SKSpriteNode(color:UIColor.white, size: CGSize(width: 20, height: 20))
        //player2.position = CGPoint(x: 0, y: -40)
        player2.position = CGPoint(x: self.size.width / 2, y: 350)
        player2.name = "Player"
        player2.physicsBody?.isDynamic = false
        player2.physicsBody = SKPhysicsBody(rectangleOf: player2.size)
        player2.physicsBody?.categoryBitMask = CollisionBitMask.Player
        player2.physicsBody?.collisionBitMask = 0
        player2.physicsBody?.contactTestBitMask = CollisionBitMask.Obstacle
        
        addChild(player)
        addChild(player2)
        
        initialPlayerPosition = player.position
    }
    
    func addObstacle (type:ObstacleType) -> SKSpriteNode {
        let obstacle = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 0, height: 30))
        obstacle.name = "Obstacle"
        obstacle.physicsBody?.isDynamic = true
        
        switch type {
        case .small:
            obstacle.size.width = self.size.width * 0.2
            break
        case .medium:
            obstacle.size.width = self.size.width * 0.35
            break
        case .large:
            obstacle.size.width = self.size.width * 0.75
            break
        }
        
        obstacle.position = CGPoint(x: 0, y: self.size.height + obstacle.size.height)
        obstacle.physicsBody = SKPhysicsBody(rectangleOf: obstacle.size)
        obstacle.physicsBody?.categoryBitMask = CollisionBitMask.Obstacle
        obstacle.physicsBody?.collisionBitMask = 0
        
        return obstacle
    }
    
    func addMovement(obstacle:SKSpriteNode) {
        var actionArray = [SKAction]()
        
        actionArray.append(SKAction.move(to: CGPoint(x: obstacle.position.x, y: -obstacle.size.height), duration: TimeInterval(3)))
        actionArray.append(SKAction.removeFromParent())
        
        obstacle.run(SKAction.sequence(actionArray))
    }
    
    func addRow(type:RowType) {
        switch type {
        case .oneS:
            let obst = addObstacle(type: .small)
            obst.position = CGPoint(x: self.size.width / 2, y: obst.position.y)
            //obst.position = CGPoint(x: 0, y: obst.position.y)
            addMovement(obstacle: obst)
            addChild(obst)
            break
        case .oneM:
            let obst = addObstacle(type: .medium)
            obst.position = CGPoint(x: self.size.width / 2, y: obst.position.y)
            //obst.position = CGPoint(x: 0, y: obst.position.y)
            addMovement(obstacle: obst)
            addChild(obst)
            break
        case .oneL:
            let obst = addObstacle(type: .large)
            obst.position = CGPoint(x: self.size.width / 2, y: obst.position.y)
            //obst.position = CGPoint(x: 0, y: obst.position.y)
            addMovement(obstacle: obst)
            addChild(obst)
            break
        case .twoS:
            let obst1 = addObstacle(type: .small)
            let obst2 = addObstacle(type: .small)
            
            obst1.position = CGPoint(x: obst1.size.width + 50, y: obst1.position.y)
            obst2.position = CGPoint(x: self.size.width - obst2.size.width / 2 - 50, y: obst1.position.y)
            
            addMovement(obstacle: obst1)
            addMovement(obstacle: obst2)
            
            addChild(obst1)
            addChild(obst2)
            break
        case .twoM:
            let obst1 = addObstacle(type: .medium)
            let obst2 = addObstacle(type: .medium)
            
            obst1.position = CGPoint(x: obst1.size.width / 2 + 50, y: obst1.position.y)
            obst2.position = CGPoint(x: self.size.width - obst2.size.width / 2 - 50, y: obst1.position.y)
            
            addMovement(obstacle: obst1)
            addMovement(obstacle: obst2)
            
            addChild(obst1)
            addChild(obst2)
            break
        case .threeS:
            let obst1 = addObstacle(type: .small)
            let obst2 = addObstacle(type: .small)
            let obst3 = addObstacle(type: .small)
            
            //left wall
            obst1.position = CGPoint(x: obst1.size.width / 2 + 50, y: obst1.position.y)
            //right wall
            obst2.position = CGPoint(x: self.size.width - obst2.size.width / 2 + 50, y: obst1.position.y)
            //center wall
            obst3.position = CGPoint(x: self.size.width / 2 + 50, y: obst1.position.y)
            
            addMovement(obstacle: obst1)
            addMovement(obstacle: obst2)
            addMovement(obstacle: obst3)

            addChild(obst1)
            addChild(obst2)
            addChild(obst3)
            break
        }
        
    }
    
}
