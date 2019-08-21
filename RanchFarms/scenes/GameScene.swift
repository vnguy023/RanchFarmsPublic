import SpriteKit
import GameController
import GameplayKit

class GameScene: BaseScene {
    let cameraController = CameraController()
    let inputController = InputController()
    var actionController: ActionController!
    var hudController: HudController!

    override func didMove(to view: SKView) {
        // TODO find a proper home for this
        loadGame()

        linkControllers()
    }

    private func linkControllers() {
        actionController = ActionController(world: world)
        hudController = HudController(camera: cameraController.camera, world: world, screenSize: self.size)

        inputController.handleMove = actionController.actionMove
        inputController.handlePrimary[.ClickDown] = actionController.actionPrimary
    }

    private func loadGame() {
        world = World(saveLocation: "Default")

        self.addChild(world)

        self.camera = cameraController.camera
        cameraController.gameObjectToFollow = world.player
        self.addChild(cameraController.camera)
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
            inputController.pressedDown(inputKey: .MoveUp, value: true)
        case 0:     // a
            inputController.pressedDown(inputKey: .MoveLeft, value: true)
        case 1:     // s
            inputController.pressedDown(inputKey: .MoveDown, value: true)
        case 2:     // d
            inputController.pressedDown(inputKey: .MoveRight, value: true)

        case 0x31:  // spaceBar
            inputController.pressedDown(inputKey: .Primary, value: true)

        case 12:    // q
            inputController.pressedDown(inputKey: .SwitchLeft, value: true)
        case 14:    // e
            inputController.pressedDown(inputKey: .SwitchRight, value: true)

        case 42:    // \
            inputController.pressedDown(inputKey: .TOGGLE_KEYBOARD_MODE, value: true)
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }

    override func keyUp(with event: NSEvent) {
        switch event.keyCode {
        case 13:    // w
            inputController.pressedDown(inputKey: .MoveUp, value: false)
        case 0:     // a
            inputController.pressedDown(inputKey: .MoveLeft, value: false)
        case 1:     // s
            inputController.pressedDown(inputKey: .MoveDown, value: false)
        case 2:     // d
            inputController.pressedDown(inputKey: .MoveRight, value: false)

        case 0x31:  // spaceBar
            inputController.pressedDown(inputKey: .Primary, value: false)

        case 12:    // q
            inputController.pressedDown(inputKey: .SwitchLeft, value: false)
        case 14:    // e
            inputController.pressedDown(inputKey: .SwitchRight, value: false)

        case 42:    // \
            inputController.pressedDown(inputKey: .TOGGLE_KEYBOARD_MODE, value: false)
        default:
            print("keyUp: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        processControllerInput()
        inputController.update()

        cameraController.update()
        hudController.update()
    }

    func processControllerInput() {
        // TODO: Figure out how to do this properly for multiple people/controllers
        for gc in GCController.controllers() {
            if gc.playerIndex == .indexUnset {
                // need to assign a player to this
                // for now setting all to player 1
                gc.playerIndex = .index1
            }

            var player = PlayerIndex.PlayerOne
            switch gc.playerIndex {
            case .index1:
                player = .PlayerOne
            default: break
            }

            let moveVector = CGVector(dx: CGFloat(gc.extendedGamepad!.leftThumbstick.xAxis.value),
                                      dy: CGFloat(gc.extendedGamepad!.leftThumbstick.yAxis.value))
            let movePower = min(moveVector.getMagnitude(), CGFloat(1))
            inputController.SetLeftThumbStick(player: player, direction: moveVector, power: movePower)

            inputController.pressedDown(inputKey: .Primary, value: gc.extendedGamepad!.buttonA.isPressed)
            inputController.pressedDown(inputKey: .Cancel, value: gc.extendedGamepad!.buttonB.isPressed)
            inputController.pressedDown(inputKey: .Use, value: gc.extendedGamepad!.buttonX.isPressed)
            inputController.pressedDown(inputKey: .Menu, value: gc.extendedGamepad!.buttonY.isPressed)

            inputController.pressedDown(inputKey: .SwitchLeft, value: gc.extendedGamepad!.leftShoulder.isPressed)
            inputController.pressedDown(inputKey: .SwitchRight, value: gc.extendedGamepad!.rightShoulder.isPressed)
        }
    }
}
