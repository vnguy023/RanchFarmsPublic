import SpriteKit

extension ActionController {
    func actionPrimaryGameStateStore() { }

    func actionCancelGameStateStore() {
        changeGameState(to: .Game)
    }

    func actionDPadUpGameStateStore() {
        world.hudInterfaceData.changeStoreCursorPosition(CGVector(dx:0, dy: 1))
    }

    func actionDPadDownGameStateStore() {
        world.hudInterfaceData.changeStoreCursorPosition(CGVector(dx:0, dy: -1))
    }

    func actionDPadLeftGameStateStore() {
        world.hudInterfaceData.changeStoreCursorPosition(CGVector(dx:-1, dy: 0))
    }

    func actionDPadRightGameStateStore() {
        world.hudInterfaceData.changeStoreCursorPosition(CGVector(dx:1, dy: 0))
    }
}