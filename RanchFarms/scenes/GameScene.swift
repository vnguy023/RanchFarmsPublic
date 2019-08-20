import SpriteKit
import GameplayKit

class GameScene: BaseScene {
    let cameraController = CameraController()

    override func didMove(to view: SKView) {
        // TODO find a proper home for this
        loadGame()
    }

    private func loadGame() {
        world = World(saveLocation: "Default")

        self.addChild(world)

        self.camera = cameraController.camera
        cameraController.gameObjectToFollow = world.player
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
            world.player.position = world.player.position + CGVector(dx: 0, dy: 8)
        case 0:     // a
            world.player.position = world.player.position + CGVector(dx: -8, dy: 0)
        case 1:     // s
            world.player.position = world.player.position + CGVector(dx: 0, dy: -8)
        case 2:     // d
            world.player.position = world.player.position + CGVector(dx: 8, dy: 0)

        case 0x31:  // spaceBar
            switch world.currentLocation{
            case .Farm:
                world.changeLocation(to: .Town, playerPosition: CGPoint(x: 0*32, y: 0))
            case .Town:
                world.changeLocation(to: .Farm, playerPosition: CGPoint(x: -5*32, y: 0))
            }
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered

        cameraController.update()
    }
}
