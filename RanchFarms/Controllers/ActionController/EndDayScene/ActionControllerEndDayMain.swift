import SpriteKit

extension ActionControllerEndDay {
    func actionPrimaryMain() {
        let cmdEndDay  = CmdEndDay(world: world)
        cmdEndDay.execute()

        scene.vc.loadGameScene(saveSlot: world.saveSlot)
    }

    func actionUseMain() {
        actionPrimaryMain()
    }

    func actionCancelMain() {
    }

    func actionDPadUpMain() { }

    func actionDPadDownMain() { }

    func actionDPadLeftMain() { }

    func actionDPadRightMain() { }
}

