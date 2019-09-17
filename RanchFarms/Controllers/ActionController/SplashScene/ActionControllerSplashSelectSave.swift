import SpriteKit

extension ActionControllerSplashScene {
    func actionPrimarySelectSave() {
        if let saveSlot = hudInterfaceData.getSaveSlotSelected() {
            let cmdLoadGame = CmdLoadGame(saveSlot: saveSlot)
            cmdLoadGame.execute()

            switch cmdLoadGame.result {
            case .Success:
                scene.vc.loadGameScene(saveSlot: saveSlot)
            case .NoSaveFile:
                createNewGame(saveSlot: saveSlot)

                // temporary until we change scene to creating
                scene.vc.loadGameScene(saveSlot: saveSlot)
            default:
                print ("[ActionController] [SplashScene] [Loading SaveFile] [Error=Loading File] [Result\(cmdLoadGame.result)]")
            }
        }
    }

    func actionUseSelectSave() {
        actionPrimarySelectSave()
    }

    func actionCancelSelectSave() {
        changeState(to: .Splash)
    }

    func actionDPadUpSelectSave() {
        hudInterfaceData.changeSelectSaveCursor(CGVector(dx: 0, dy: 1))
    }

    func actionDPadDownSelectSave() {
        hudInterfaceData.changeSelectSaveCursor(CGVector(dx: 0, dy: -1))
    }

    func actionDPadLeftSelectSave() {
        hudInterfaceData.changeSelectSaveCursor(CGVector(dx: -1, dy: 0))
    }

    func actionDPadRightSelectSave() {
        hudInterfaceData.changeSelectSaveCursor(CGVector(dx: 1, dy: 0))
    }

    private func createNewGame(saveSlot: SaveSlot) {
        let cmdCreateNewGame = CmdCreateNewGame()
        cmdCreateNewGame.execute()

        let cmdSaveGame = CmdSaveGame(worldData: cmdCreateNewGame.worldData, saveSlot: saveSlot)
        cmdSaveGame.execute()
    }
}
