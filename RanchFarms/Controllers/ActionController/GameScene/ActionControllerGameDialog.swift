import SpriteKit

extension ActionControllerGame {
    func actionPrimaryGameStateDialog() { }

    func actionCancelGameStateDialog() {
        world.hudInterfaceData.dialog = nil
        changeState(to: .Game)
    }

    func actionDPadUpGameStateDialog() { }

    func actionDPadDownGameStateDialog() { }

    func actionDPadLeftGameStateDialog() { }

    func actionDPadRightGameStateDialog() { }
}
