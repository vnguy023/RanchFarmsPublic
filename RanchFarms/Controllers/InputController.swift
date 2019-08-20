import SpriteKit

class InputController {
    enum InputKey {
        case MoveUp, MoveDown, MoveLeft, MoveRight
        case TOGGLE_KEYBOARD_MODE
    }

    private var IsKeyDown = [InputKey: Bool]()
    private var IsKeyUp = [InputKey: Bool]()

    private var keyBoardEnabled = true

    private var playerLeftThumbStickVector = [PlayerIndex: CGVector]()
    private var playerRightThumbStickVector = [PlayerIndex: CGVector]()

    var handleMove: ((CGVector)->())!

    init() { }

    func update() {
        if IsKeyUp[InputKey.TOGGLE_KEYBOARD_MODE] != nil {
            if keyBoardEnabled { // toggle between modes
                keyBoardEnabled = false
            } else {
                keyBoardEnabled = true
            }
            print ("[KeyboardMode=\(keyBoardEnabled)]")
        }

        if keyBoardEnabled {
            ProcessKeyboardMode()
        } else {
            ProcessControllerMode()
        }

        IsKeyUp.removeAll()
    }

    private func ProcessKeyboardMode() {
        var moveVector = CGVector()
        if IsKeyDown[InputKey.MoveUp] != nil {
            moveVector.dy += 1.0
        }
        if IsKeyDown[InputKey.MoveDown] != nil {
            moveVector.dy -= 1.0
        }
        if IsKeyDown[InputKey.MoveRight] != nil {
            moveVector.dx += 1.0
        }
        if IsKeyDown[InputKey.MoveLeft] != nil {
            moveVector.dx -= 1.0
        }
        moveVector = moveVector.normalize()

        if !moveVector.isZeroVector && handleMove != nil {
            handleMove(moveVector)
        }
    }

    private func ProcessControllerMode() {
        var players = [PlayerIndex]()
        players.append(.PlayerOne)

        for playerIndex in players {
            if let moveVector = playerLeftThumbStickVector[playerIndex],
                !moveVector.isZeroVector && handleMove != nil {
                    handleMove(moveVector)
            }
        }
    }

    func keyUp(_ inputKey: InputKey) {
        IsKeyDown[inputKey] = nil
        IsKeyUp[inputKey] = true
    }

    func keyDown(_ inputKey: InputKey) {
        IsKeyDown[inputKey] = true
        IsKeyUp[inputKey] = nil
    }

    func SetLeftThumbStick(player: PlayerIndex, direction: CGVector, power: CGFloat) {
        playerLeftThumbStickVector[player] = direction.normalize().scale(power)
    }

    func SetRightThumbStick(player: PlayerIndex, direction: CGVector, power: CGFloat) {
        playerRightThumbStickVector[player] = direction.normalize().scale(power)
    }
}
