//
//  GameViewController.swift
//  IOS FINAL
//
//  Created by Rodrigues Isaac on 4/5/18.
//  Copyright © 2018 Rodrigues Isaac. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {
        var audio = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            audio = try AVAudioPlayer(contentsOf :URL.init(fileURLWithPath: Bundle.main.path(forResource: "background", ofType: "mp3")!))
            audio.play()
        } catch {
            print("Cannot play the file")
        }
        
        //if let scene = GameScene(fileNamed:"GameScene") {
        let scene = GameTitleScene(size: view.bounds.size)
        
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            skView.ignoresSiblingOrder = true
            
            scene.scaleMode = .resizeFill
            
            skView.presentScene(scene)
        //}
        //if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            //if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
               // scene.scaleMode = .aspectFill
                
                // Present the scene
                //view.presentScene(scene)
            //}
            
            //view.ignoresSiblingOrder = true
            
            //view.showsFPS = true
            //view.showsNodeCount = true
        //}
    }
    
    static let sharedHelper = GameViewController()

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}


