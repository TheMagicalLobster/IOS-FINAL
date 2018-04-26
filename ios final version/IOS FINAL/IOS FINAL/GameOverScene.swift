//
//  GameOverScene.swift
//  IOS FINAL
//
//  Created by Rodrigues Isaac on 4/19/18.
//  Copyright © 2018 Rodrigues Isaac. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
     var label: SKLabelNode?
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.backgroundColor = SKColor.gray
        let message = "Game Over"
        
        let font: String = "Optima-ExtraBlack"
        label = SKLabelNode(fontNamed: font)
        label!.text = message
        label!.fontColor = SKColor.white
        label!.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        
        addChild(label!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let transition = SKTransition.fade(withDuration: 0.5)
        let gameScene = GameScene(size: self.size)
        self.view?.presentScene(gameScene, transition: transition)
    }
}
