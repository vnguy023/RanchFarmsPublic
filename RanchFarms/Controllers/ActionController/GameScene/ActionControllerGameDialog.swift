import SpriteKit

extension ActionControllerGame {
    func actionPrimaryGameStateDialog() {
        world.hudInterfaceData.currentDialogSectionId += 1
        if world.hudInterfaceData.currentDialogSectionId >= world.hudInterfaceData.dialog!.sections.count {
            finishedTalking()
        }
    }

    func actionCancelGameStateDialog() {
        finishedTalking()
    }

    func actionDPadUpGameStateDialog() { }

    func actionDPadDownGameStateDialog() { }

    func actionDPadLeftGameStateDialog() { }

    func actionDPadRightGameStateDialog() { }

    private func finishedTalking() {
        world.hudInterfaceData.dialog = nil
        changeState(to: .Game)
    }
}
