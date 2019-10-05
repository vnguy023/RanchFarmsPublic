import SpriteKit

extension ActionControllerGame {
    func actionPrimaryGameStateDialog() {
        if !world.hudInterfaceData.dialog!.sections[world.hudInterfaceData.currentDialogSectionIndex].dialogOptions.isEmpty {
            if let gameEventId = world.hudInterfaceData.dialog!.sections[world.hudInterfaceData.currentDialogSectionIndex]
                .dialogOptions[world.hudInterfaceData.currentDialogOptionIndex].gameEventId {
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
        if world.hudInterfaceData.currentDialogSectionIndex >= world.hudInterfaceData.dialog!.sections.count {
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
        world.hudInterfaceData.currentDialogOptionIndex = min(world.hudInterfaceData.currentDialogOptionIndex + 1, world.hudInterfaceData.dialog!.sections[world.hudInterfaceData.currentDialogSectionIndex].dialogOptions.count - 1)
    }

    func actionDPadLeftGameStateDialog() { }

    func actionDPadRightGameStateDialog() { }

    private func finishedTalking() {
        changeState(to: .Game)
    }
}
