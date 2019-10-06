import SpriteKit

extension ActionControllerGame {
    // Things to make code a bit more simpler
    var dialog: Dialog! { get {world.hudInterfaceData.dialog} }
    var currentSection: DialogSection! {
        get {world.hudInterfaceData.dialog!.sections[world.hudInterfaceData.currentDialogSectionIndex]}
    }
    var currentDialogOption: DialogOption! {
        get {world.hudInterfaceData.dialog!.sections[world.hudInterfaceData.currentDialogSectionIndex]
            .dialogOptions[world.hudInterfaceData.currentDialogOptionIndex]
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
        
        world.hudInterfaceData.currentDialogSectionIndex += 1
        world.hudInterfaceData.currentDialogOptionIndex = 0
        if world.hudInterfaceData.currentDialogSectionIndex >= dialog.sections.count {
            finishedTalking()
        }
    }

    func actionCancelGameStateDialog() {
        finishedTalking()
    }

    func actionDPadUpGameStateDialog() {
        world.hudInterfaceData.currentDialogOptionIndex = max(0, world.hudInterfaceData.currentDialogOptionIndex - 1)
    }

    func actionDPadDownGameStateDialog() {
        world.hudInterfaceData.currentDialogOptionIndex = min(world.hudInterfaceData.currentDialogOptionIndex + 1, currentSection.dialogOptions.count - 1)
    }

    func actionDPadLeftGameStateDialog() { }

    func actionDPadRightGameStateDialog() { }

    private func finishedTalking() {
        changeState(to: .Game)
    }
}
