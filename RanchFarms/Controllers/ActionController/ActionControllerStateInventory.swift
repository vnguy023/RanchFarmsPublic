import SpriteKit

extension ActionController {
    func actionPrimaryGameStateInventory() {
        // just keep reassigning for now
        if world.hudInterfaceData.selectedItemInventoryIndex == nil {
            world.hudInterfaceData.selectedItemInventoryIndex = world.hudInterfaceData.highlightedItemInventoryIndex
        }
    }

    func actionCancelGameStateInventory() {
        if world.hudInterfaceData.selectedItemInventoryIndex != nil {
            world.hudInterfaceData.selectedItemInventoryIndex = nil
        } else {
            changeGameState(to: .Game)
        }
    }

    func actionDPadUpGameStateInventory() {
        world.hudInterfaceData.changeInventoryIndexUp()
    }

    func actionDPadDownGameStateInventory() {
        world.hudInterfaceData.changeInventoryIndexDown()
    }

    func actionDPadLeftGameStateInventory() {
        world.hudInterfaceData.changeInventoryIndexLeft()
    }

    func actionDPadRightGameStateInventory() {
        world.hudInterfaceData.changeInventoryIndexRight()
    }
}
