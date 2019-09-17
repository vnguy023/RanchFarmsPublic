import SpriteKit

extension ActionControllerGame {
    func actionPrimaryGameStateDialog() { }

    func actionCancelGameStateDialog() {
        changeState(to: .Game)
    }

    func actionDPadUpGameStateDialog() { }

    func actionDPadDownGameStateDialog() { }

    func actionDPadLeftGameStateDialog() { }

    func actionDPadRightGameStateDialog() { }
}
