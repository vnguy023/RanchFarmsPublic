import SpriteKit

extension ActionControllerEndDay {
    func actionPrimaryMain() {
        let cmdEndDay  = CmdEndDay(world: world)
        cmdEndDay.execute()

        let worldData = world.getWorldDataSave()

        let cmdSave = CmdSaveGame(worldData: worldData, saveSlot: world.saveSlot)
        cmdSave.execute()

        switch cmdSave.result {
        case .Success:
            scene.vc.loadGameScene(world: cmdSave.world)
        default:
            print ("[ActionController] [EndDay] [Error=Save Game] [Result\(cmdSave.result)]")
        }
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

