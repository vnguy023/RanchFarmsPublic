import SpriteKit

class ActionControllerEndDay {
    let scene: EndDayScene

    let inputController: InputController!

    let world: World

    init(scene: EndDayScene, inputController: InputController, world: World) {
        self.scene = scene

        self.inputController = inputController

        self.world = world

        assignActionsEndDay()
    }

    private func assignActionsEndDay() {
        inputController.clearHandles()

        inputController.handlePrimary[.ClickDown] = actionPrimaryMain
        inputController.handleUse[.ClickDown] = actionUseMain
        inputController.handleCancel[.ClickDown] = actionCancelMain

        inputController.handleDPadUp[.ClickDown] = actionDPadUpMain
        inputController.handleDPadDown[.ClickDown] = actionDPadDownMain
        inputController.handleDPadLeft[.ClickDown] = actionDPadLeftMain
        inputController.handleDPadRight[.ClickDown] = actionDPadRightMain
    }
}
