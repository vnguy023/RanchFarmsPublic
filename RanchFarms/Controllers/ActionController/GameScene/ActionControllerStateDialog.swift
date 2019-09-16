import SpriteKit

extension ActionController {
    func actionPrimaryGameStateDialog() { }

    func actionCancelGameStateDialog() {
        changeState(to: .Game)
    }

    func actionDPadUpGameStateDialog() { }

    func actionDPadDownGameStateDialog() { }

    func actionDPadLeftGameStateDialog() { }

    func actionDPadRightGameStateDialog() { }
}
