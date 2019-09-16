import SpriteKit

extension ActionControllerSplashScene {
    func actionPrimarySplash() {
        changeState(to: .SelectSave)
    }

    func actionUseSplash() {
        actionPrimarySplash()
    }

    func actionCancelSplash() {
    }

    func actionDPadUpSplash() { }

    func actionDPadDownSplash() { }

    func actionDPadLeftSplash() { }

    func actionDPadRightSplash() { }
}
