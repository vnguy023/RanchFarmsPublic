import SpriteKit

extension ActionController {
    func actionPrimaryGameStateDialog() { }

    func actionCancelGameStateDialog() {
        changeGameState(to: .Game)
    }

    func actionDPadUpGameStateDialog() { }

    func actionDPadDownGameStateDialog() { }

    func actionDPadLeftGameStateDialog() { }

    func actionDPadRightGameStateDialog() { }
}
