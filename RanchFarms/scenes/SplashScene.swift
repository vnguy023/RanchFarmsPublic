import SpriteKit
import GameplayKit
import GameController

class SplashScene: BaseScene {
    var inputController = InputController()

    override func didMove(to view: SKView) {
        assignActions()
    }

    func touchDown(atPoint pos : CGPoint) {
    }

    func touchMoved(toPoint pos : CGPoint) {
    }

    func touchUp(atPoint pos : CGPoint) {
        inputController.pressedDown(inputKey: .Primary, value: true)
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
            inputController.pressedDown(inputKey: .Primary, value: true)
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        processControllerInput()
        inputController.update()
    }

    private func assignActions() {
        inputController.clearHandles()

        //inputController.handleMove = actionMove
        inputController.handlePrimary[.ClickDown] = actionPrimary
        //inputController.handleMenu[.ClickDown] = actionMenu
        //inputController.handleUse[.ClickDown] = actionUse
    }

    private func actionPrimary() {

        // temporary til we figure this out
        let saveSlot = SaveSlot.Slot1
        createNewGame(saveSlot: saveSlot)

        vc!.loadGameScene(saveSlot: saveSlot)
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

            inputController.pressedDown(inputKey: .DPadUp, value: gc.extendedGamepad!.dpad.up.isPressed)
            inputController.pressedDown(inputKey: .DPadDown, value: gc.extendedGamepad!.dpad.down.isPressed)
            inputController.pressedDown(inputKey: .DPadLeft, value: gc.extendedGamepad!.dpad.left.isPressed)
            inputController.pressedDown(inputKey: .DPadRight, value: gc.extendedGamepad!.dpad.right.isPressed)
        }
    }

    private func createNewGame(saveSlot: SaveSlot) {
        let cmdSaveFile = CmdSaveFile(directory: Config.SaveDirectory,
                                      fileName: saveSlot.getFileName(),
                                      fileExtension: Config.SaveFileExtension,
                                      text: "Hello World, Ranch Farms1243")
        cmdSaveFile.execute()
    }

}
