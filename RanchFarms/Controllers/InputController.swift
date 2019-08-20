import SpriteKit

class InputController {
    enum InputKey {
        case MoveUp, MoveDown, MoveLeft, MoveRight

        case Primary
        case Cancel
        case Use
        case Menu

        case SwitchLeft, SwitchRight
        case TOGGLE_KEYBOARD_MODE
    }

    enum ButtonState {
        case IsUp, IsDown
        case ClickUp, ClickDown
    }

    private var IsKeyDown = [InputKey: Bool]()
    private var IsKeyUp = [InputKey: Bool]()

    private var mButtonState = [InputKey: ButtonState]()

    private var keyBoardEnabled = true

    private var playerLeftThumbStickVector = [PlayerIndex: CGVector]()
    private var playerRightThumbStickVector = [PlayerIndex: CGVector]()

    var handleMove: ((CGVector)->())!

    var handlePrimary = [ButtonState: (()->())]()
    var handleCancel = [ButtonState: (()->())]()
    var handleUse = [ButtonState: (()->())]()
    var handleMenu = [ButtonState: (()->())]()

    var handleSwitchLeft = [ButtonState: (()->())]()
    var handleSwitchRight = [ButtonState: (()->())]()

    private func getButtonState(_ inputKey: InputKey) -> ButtonState {
        if mButtonState[inputKey] == nil {
            mButtonState[inputKey] = .IsUp
        }
        return mButtonState[inputKey]!
    }

    init() { }

    func update() {
        if getButtonState(.TOGGLE_KEYBOARD_MODE) == ButtonState.ClickDown {
            if keyBoardEnabled { // toggle between modes
                keyBoardEnabled = false
            } else {
                keyBoardEnabled = true
            }

            IsKeyDown.removeAll()
            IsKeyUp.removeAll()
            print ("[KeyboardMode=\(keyBoardEnabled)]")
        }

        // This is primarily for joysticks currently
        if keyBoardEnabled {
            ProcessKeyboardMode()
        } else {
            ProcessControllerMode()
        }

        ProcessUpdate()

        // need to set the state to IsUp/IsDown
        if getButtonState(.Primary) == .ClickUp {mButtonState[.Primary] = .IsUp}
        if getButtonState(.Cancel) == .ClickUp {mButtonState[.Cancel] = .IsUp}
        if getButtonState(.Use) == .ClickUp {mButtonState[.Use] = .IsUp}
        if getButtonState(.Menu) == .ClickUp {mButtonState[.Menu] = .IsUp}

        if getButtonState(.SwitchLeft) == .ClickUp {mButtonState[.SwitchLeft] = .IsUp}
        if getButtonState(.SwitchRight) == .ClickUp {mButtonState[.SwitchRight] = .IsUp}

        if getButtonState(.Primary) == .ClickDown {mButtonState[.Primary] = .IsDown}
        if getButtonState(.Cancel) == .ClickDown {mButtonState[.Cancel] = .IsDown}
        if getButtonState(.Use) == .ClickDown {mButtonState[.Use] = .IsDown}
        if getButtonState(.Menu) == .ClickDown {mButtonState[.Menu] = .IsDown}

        if getButtonState(.SwitchLeft) == .ClickDown {mButtonState[.SwitchLeft] = .IsDown}
        if getButtonState(.SwitchRight) == .ClickDown {mButtonState[.SwitchRight] = .IsDown}
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

    private func ProcessUpdate() {
        if let executeHandle = handlePrimary[getButtonState(.Primary)] { executeHandle() }
        if let executeHandle = handleCancel[getButtonState(.Cancel)] { executeHandle() }
        if let executeHandle = handleUse[getButtonState(.Use)] { executeHandle() }
        if let executeHandle = handleMenu[getButtonState(.Menu)] { executeHandle() }

        if let executeHandle = handleSwitchLeft[getButtonState(.SwitchLeft)] { executeHandle() }
        if let executeHandle = handleSwitchRight[getButtonState(.SwitchRight)] { executeHandle() }
    }

    func keyUp(_ inputKey: InputKey) {
        IsKeyDown[inputKey] = nil
        IsKeyUp[inputKey] = true
    }

    func keyDown(_ inputKey: InputKey) {
        IsKeyDown[inputKey] = true
        IsKeyUp[inputKey] = nil
    }

    func pressedDown(inputKey: InputKey, value: Bool) {
        if value {
            switch getButtonState(inputKey) {
            case .IsUp:
                mButtonState[inputKey] = .ClickDown
            case .IsDown:
                mButtonState[inputKey] = .IsDown
            case .ClickUp:
                mButtonState[inputKey] = .ClickDown
            case .ClickDown:
                mButtonState[inputKey] = .IsDown
            }
        } else {
            switch getButtonState(inputKey) {
            case .IsUp:
                mButtonState[inputKey] = .IsUp
            case .IsDown:
                mButtonState[inputKey] = .ClickUp
            case .ClickUp:
                mButtonState[inputKey] = .IsUp
            case .ClickDown:
                mButtonState[inputKey] = .ClickUp
            }
        }
    }

    func SetLeftThumbStick(player: PlayerIndex, direction: CGVector, power: CGFloat) {
        playerLeftThumbStickVector[player] = direction.normalize().scale(power)
    }

    func SetRightThumbStick(player: PlayerIndex, direction: CGVector, power: CGFloat) {
        playerRightThumbStickVector[player] = direction.normalize().scale(power)
    }

    func clearHandles() {
        handleMove = nil

        handlePrimary.removeAll()
        handleCancel.removeAll()
        handleUse.removeAll()
        handleMenu.removeAll()

        handleSwitchLeft.removeAll()
        handleSwitchRight.removeAll()
    }
}
