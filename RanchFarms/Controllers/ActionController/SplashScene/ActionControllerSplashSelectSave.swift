import SpriteKit

extension ActionControllerSplashScene {
    func actionPrimarySelectSave() {
        if let saveSlot = hudInterfaceData.getSaveSlotSelected() {
            let cmdLoadGame = CmdLoadGame(saveSlot: saveSlot)
            cmdLoadGame.execute()

            switch cmdLoadGame.result {
            case .Success:
                scene.vc.loadGameScene(world: cmdLoadGame.world)
            case .NoSaveFile:
                let newWorld = createNewGame(saveSlot: saveSlot)

                // temporary until we change scene to creating
                scene.vc.loadGameScene(world: newWorld)
            default:
                print ("[ActionController] [SplashScene] [Loading SaveFile] [Error=Loading File] [Result\(cmdLoadGame.result)]")
            }
        }

        if let trashSaveSlot = hudInterfaceData.getTrashSlotSelected() {
            deleteGame(saveSlot: trashSaveSlot)

            hudInterfaceData.reloadHud = true
            print ("[ActionController] [SplashScene] [Deleted SaveFile] [saveSlot=\(trashSaveSlot)]]")
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

    private func createNewGame(saveSlot: SaveSlot) -> World {
        let cmdCreateNewGame = CmdCreateNewGame()
        cmdCreateNewGame.execute()

        let cmdSaveGame = CmdSaveGame(worldData: cmdCreateNewGame.worldData, saveSlot: saveSlot)
        cmdSaveGame.execute()
        // TODO: add a verification here taht the save was a success or not and react accordingly

        return cmdSaveGame.world
    }

    private func deleteGame(saveSlot: SaveSlot) {
        let cmd = CmdDeleteFile(directory: Config.SaveDirectory, fileName: saveSlot.getFileName(), fileExtension: Config.SaveFileExtension)
        cmd.execute()
    }
}
