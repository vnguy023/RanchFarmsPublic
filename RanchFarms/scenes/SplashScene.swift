import SpriteKit
import GameplayKit
import GameController

class SplashScene: BaseScene {
    var actionControllerSplash: ActionControllerSplashScene! = nil
    var hudInterfaceDataSplash = HudInterfaceDataSplash()

    var hudController: HudControllerSplash! = nil
    var inputController = InputController()

    // unique to this scene because didMoveTo is not called for first Scene~
    override func sceneDidLoad() {
        linkControllers()
        linkNodes()
    }

    private func linkControllers() {
        hudController = HudControllerSplash(hudInterfaceDataSplash: hudInterfaceDataSplash, screenSize: self.size)
        actionControllerSplash = ActionControllerSplashScene(scene: self,
                                                             hudInterfaceDataSplash: hudInterfaceDataSplash,
                                                             inputController: inputController)
    }

    private func linkNodes() {
        self.addChild(hudController.node)
    }

    func touchDown(atPoint pos : CGPoint) {
        inputController.pressedDown(inputKey: .Primary, value: true)
    }

    func touchMoved(toPoint pos : CGPoint) {
    }

    func touchUp(atPoint pos : CGPoint) {
        inputController.pressedDown(inputKey: .Primary, value: false)
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
        case 13:    // w
            inputController.pressedDown(inputKey: .MoveUp, value: true)
        case 0:     // a
            inputController.pressedDown(inputKey: .MoveLeft, value: true)
        case 1:     // s
            inputController.pressedDown(inputKey: .MoveDown, value: true)
        case 2:     // d
            inputController.pressedDown(inputKey: .MoveRight, value: true)

        case 36:    // enter
            inputController.pressedDown(inputKey: .Primary, value: true)
        case 11:    // b
            inputController.pressedDown(inputKey: .Cancel, value: true)
        case 34:    // i
            inputController.pressedDown(inputKey: .Menu, value: true)
        case 0x31:  // spaceBar
            inputController.pressedDown(inputKey: .Use, value: true)

        case 12:    // q
            inputController.pressedDown(inputKey: .SwitchLeft, value: true)
        case 14:    // e
            inputController.pressedDown(inputKey: .SwitchRight, value: true)

        case 126:   // ArrowUp
            inputController.pressedDown(inputKey: .DPadUp, value: true)
        case 125:   // ArrowDown
            inputController.pressedDown(inputKey: .DPadDown, value: true)
        case 123:   // ArrowLeft
            inputController.pressedDown(inputKey: .DPadLeft, value: true)
        case 124:   // ArrowRight
            inputController.pressedDown(inputKey: .DPadRight, value: true)

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

        case 36:    // enter
            inputController.pressedDown(inputKey: .Primary, value: false)
        case 11:    // b
            inputController.pressedDown(inputKey: .Cancel, value: false)
        case 34:    // i
            inputController.pressedDown(inputKey: .Menu, value: false)
        case 0x31:  // spaceBar
            inputController.pressedDown(inputKey: .Use, value: false)

        case 12:    // q
            inputController.pressedDown(inputKey: .SwitchLeft, value: false)
        case 14:    // e
            inputController.pressedDown(inputKey: .SwitchRight, value: false)

        case 126:   // ArrowUp
            inputController.pressedDown(inputKey: .DPadUp, value: false)
        case 125:   // ArrowDown
            inputController.pressedDown(inputKey: .DPadDown, value: false)
        case 123:   // ArrowLeft
            inputController.pressedDown(inputKey: .DPadLeft, value: false)
        case 124:   // ArrowRight
            inputController.pressedDown(inputKey: .DPadRight, value: false)

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

        hudController.update()
    }

    func processControllerInput() {
        if inputController.keyBoardEnabled {
            return
        }

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

            inputController.pressedDown(inputKey: .DPadUp, value: gc.extendedGamepad!.dpad.up.isPressed)
            inputController.pressedDown(inputKey: .DPadDown, value: gc.extendedGamepad!.dpad.down.isPressed)
            inputController.pressedDown(inputKey: .DPadLeft, value: gc.extendedGamepad!.dpad.left.isPressed)
            inputController.pressedDown(inputKey: .DPadRight, value: gc.extendedGamepad!.dpad.right.isPressed)
        }
    }
}
