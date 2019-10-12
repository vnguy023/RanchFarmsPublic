import SpriteKit

extension ActionControllerGame {
    // Things to make code a bit more simpler
    var dialog: Dialog! { get {hudInterfaceData.dialog} }
    var currentSection: DialogSection! {
        get {hudInterfaceData.dialog!.sections[hudInterfaceData.currentDialogSectionIndex]}
    }
    var currentDialogOption: DialogOption! {
        get {hudInterfaceData.dialog!.sections[hudInterfaceData.currentDialogSectionIndex]
            .dialogOptions[hudInterfaceData.currentDialogOptionIndex]
        }
    }

    func actionPrimaryGameStateDialog() {
        if !currentSection.dialogOptions.isEmpty {
            let cmdGift = CmdReceiveGifts(world: world, gifts: currentDialogOption.gifts)
            cmdGift.execute()

            if let gameEventId = currentDialogOption.gameEventId {
                if let gameEvent = GameEventManager.shared.getGameEvent(gameEventId: gameEventId) {
                    // TODO: Figure out if we should validate the gameEvent requirements here
                    // Shouldn't have let them select the gameEvent in the first place
                    executeGameEvent(gameEvent)
                    return
                }
            }
        }
        
        hudInterfaceData.currentDialogSectionIndex += 1
        hudInterfaceData.currentDialogOptionIndex = 0
        if hudInterfaceData.currentDialogSectionIndex >= dialog.sections.count {
            finishedTalking()
        }
    }

    func actionCancelGameStateDialog() {
        finishedTalking()
    }

    func actionDPadUpGameStateDialog() {
        hudInterfaceData.currentDialogOptionIndex = max(0, hudInterfaceData.currentDialogOptionIndex - 1)
    }

    func actionDPadDownGameStateDialog() {
        hudInterfaceData.currentDialogOptionIndex = min(hudInterfaceData.currentDialogOptionIndex + 1, currentSection.dialogOptions.count - 1)
    }

    func actionDPadLeftGameStateDialog() { }

    func actionDPadRightGameStateDialog() { }

    private func finishedTalking() {
        changeState(to: .Game)
    }
}
