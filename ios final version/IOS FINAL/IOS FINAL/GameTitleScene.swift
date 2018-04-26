//
//  GameTitleScene.swift
//  IOS FINAL
//
//  Created by Rodrigues Isaac on 4/19/18.
//  Copyright © 2018 Rodrigues Isaac. All rights reserved.
//
import SpriteKit

class GameTitleScene: SKScene {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var startLabel: SKLabelNode?
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.backgroundColor = SKColor.gray
        let message = "3D Touch Avoidance"
        
        let font: String = "Optima-ExtraBlack"
        startLabel = SKLabelNode(fontNamed: font)
        startLabel!.text = message
        startLabel!.fontColor = SKColor.white
        startLabel!.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        
        addChild(startLabel!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //let transition = SKTransition.fade(withDuration: 0.5)
        let gameScene = GameScene(size: self.size)
        gameScene.scaleMode = scaleMode
        //self.view?.presentScene(gameScene, transition: transition)
        let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
        view!.presentScene(gameScene, transition: reveal)
    }

}
