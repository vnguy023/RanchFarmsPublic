import SpriteKit

extension ActionControllerSplashScene {
    func actionPrimarySelectSave() {
        let saveSlot = SaveSlot.Slot1

        createSave(saveSlot: saveSlot)

        scene.vc.loadGameScene(saveSlot: .Slot1)
    }

    func actionUseSelectSave() {
        actionPrimarySelectSave()
    }

    func actionCancelSelectSave() {
        changeState(to: .Splash)
    }

    func actionDPadUpSelectSave() { }

    func actionDPadDownSelectSave() { }

    func actionDPadLeftSelectSave() { }

    func actionDPadRightSelectSave() { }

    private func createSave(saveSlot: SaveSlot) {
        let cmdSaveFile = CmdSaveFile(directory: Config.SaveDirectory,
                                      fileName: saveSlot.getFileName(),
                                      fileExtension: Config.SaveFileExtension,
                                      text: "Hello World, Ranch Farms1243")
        cmdSaveFile.execute()
    }
}
