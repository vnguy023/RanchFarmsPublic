import SpriteKit
import GameplayKit

class SplashScene: BaseScene {
    override func didMove(to view: SKView) {
    }

    func touchDown(atPoint pos : CGPoint) {
    }

    func touchMoved(toPoint pos : CGPoint) {
    }

    func touchUp(atPoint pos : CGPoint) {
        vc.loadGameScene()
    }

    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
    }

    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self))
    }

    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
    }

    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 0x31:
            vc!.loadGameScene()
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }


    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
