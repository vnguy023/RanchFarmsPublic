import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController {

    @IBOutlet var skView: SKView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSplashScene()
    }

    func loadGameScene(saveSlot: SaveSlot) {
        if let scene = SKScene(fileNamed: "GameScene") {
            let gameScene = (scene as! GameScene)
            gameScene.saveSlot = saveSlot

            presentScene(scene: gameScene)
        }
    }

    func loadSplashScene() {
        if let scene = SKScene(fileNamed: "SplashScene") {
            presentScene(scene: scene)
        }
    }

    private func presentScene(scene: SKScene) {
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill

        (scene as! BaseScene).vc = self

        // Present the scene
        if let view = self.skView {
            view.presentScene(scene)

            view.ignoresSiblingOrder = true

            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

}

