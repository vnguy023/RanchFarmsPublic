import SpriteKit

class ActionControllerSplashScene {
    let scene: SplashScene
    let hudInterfaceData: HudInterfaceDataSplash

    let inputController: InputController!

    var handlePause: (()->())!
    var handleUnpause: (()->())!

    init(scene: SplashScene, hudInterfaceDataSplash: HudInterfaceDataSplash, inputController: InputController) {
        self.scene = scene
        self.hudInterfaceData = hudInterfaceDataSplash

        self.inputController = inputController

        changeState(to: .Splash)
    }

    func changeState(to state: HudInterfaceDataSplash.State) {
        if hudInterfaceData.state == state {
            return
        }

        hudInterfaceData.state = state

        switch state {
        case .Splash:
            assignActionsSplash()
        case .SelectSave:
            assignActionsSelectSave()
        default:
            print ("[ActionControllerSplashScene] [Desc=new actions not assigned] [State=\(state)]")
        }

        print ("[ActionControllerSplashScene] [Desc=ChangingState] [State=\(state)]")
    }

    private func assignActionsSplash() {
        inputController.clearHandles()

        inputController.handlePrimary[.ClickDown] = actionPrimarySplash
        inputController.handleUse[.ClickDown] = actionUseSplash
        inputController.handleCancel[.ClickDown] = actionCancelSplash

        inputController.handleDPadUp[.ClickDown] = actionDPadUpSplash
        inputController.handleDPadDown[.ClickDown] = actionDPadDownSplash
        inputController.handleDPadLeft[.ClickDown] = actionDPadLeftSplash
        inputController.handleDPadRight[.ClickDown] = actionDPadRightSplash
    }

    private func assignActionsSelectSave() {
        inputController.clearHandles()

        inputController.handlePrimary[.ClickDown] = actionPrimarySelectSave
        inputController.handleUse[.ClickDown] = actionUseSelectSave
        inputController.handleCancel[.ClickDown] = actionCancelSelectSave

        inputController.handleDPadUp[.ClickDown] = actionDPadUpSelectSave
        inputController.handleDPadDown[.ClickDown] = actionDPadDownSelectSave
        inputController.handleDPadLeft[.ClickDown] = actionDPadLeftSelectSave
        inputController.handleDPadRight[.ClickDown] = actionDPadRightSelectSave
    }
}
