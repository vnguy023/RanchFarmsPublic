import SpriteKit

extension ActionControllerSplashScene {
    func actionPrimarySelectSave() {
        if let saveSlot = hudInterfaceData.getSaveSlotSelected() {
            createSave(saveSlot: saveSlot)
            scene.vc.loadGameScene(saveSlot: saveSlot)
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

    private func createSave(saveSlot: SaveSlot) {
        let cmdSaveFile = CmdSaveFile(directory: Config.SaveDirectory,
                                      fileName: saveSlot.getFileName(),
                                      fileExtension: Config.SaveFileExtension,
                                      text: "Hello World, Ranch Farms1243")
        cmdSaveFile.execute()
    }
}
