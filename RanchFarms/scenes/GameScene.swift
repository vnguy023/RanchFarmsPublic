import SpriteKit
import GameplayKit

class GameScene: BaseScene {    
    override func didMove(to view: SKView) {
        // TODO find a proper home for this
        loadGame()
    }

    private func loadGame() {
        world = World(saveLocation: "Default")

        self.addChild(world)
    }
    
    
    func touchDown(atPoint pos : CGPoint) { }
    
    func touchMoved(toPoint pos : CGPoint) { }
    
    func touchUp(atPoint pos : CGPoint) { }
    
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
        case 13:    // w
            break
        case 0:     // a
            break
        case 1:     // s
            break
        case 2:     // d
            break

        case 0x31:  // spaceBar
            switch world.currentLocation{
            case .Farm:
                world.changeLocation(to: .Town)
            case .Town:
                world.changeLocation(to: .Farm)
            }
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
