import SpriteKit

extension ActionController {
    func actionPrimaryGameStateStore() { }

    func actionCancelGameStateStore() {
        changeGameState(to: .Game)
    }

    func actionDPadUpGameStateStore() { }

    func actionDPadDownGameStateStore() { }

    func actionDPadLeftGameStateStore() { }

    func actionDPadRightGameStateStore() { }
}
