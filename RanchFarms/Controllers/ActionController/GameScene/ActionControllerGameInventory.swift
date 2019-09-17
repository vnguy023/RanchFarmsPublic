import SpriteKit

extension ActionControllerGame {
    func actionPrimaryGameStateInventory() {
        if world.hudInterfaceData.selectedItemInventoryIndex == nil {
            if world.player.inventory.items[world.hudInterfaceData.highlightedItemInventoryIndex] != nil {
                world.hudInterfaceData.selectedItemInventoryIndex = world.hudInterfaceData.highlightedItemInventoryIndex
            }
        } else {
            let selectedItem = world.player.inventory.items[world.hudInterfaceData.selectedItemInventoryIndex!]
            let highlightedItem = world.player.inventory.items[world.hudInterfaceData.highlightedItemInventoryIndex]
            if selectedItem == nil {return}
            if world.player.inventory.canAcquire(item: selectedItem!, slot: world.hudInterfaceData.highlightedItemInventoryIndex) {
                world.player.inventory.acquire(item: selectedItem!, slot: world.hudInterfaceData.highlightedItemInventoryIndex)
                world.player.inventory.items[world.hudInterfaceData.selectedItemInventoryIndex!] = nil
                world.hudInterfaceData.selectedItemInventoryIndex = nil
            } else {
                if highlightedItem != nil && highlightedItem!.type == selectedItem!.type && highlightedItem!.quantity < highlightedItem!.itemInfo.maxStack{
                    let total = selectedItem!.quantity + highlightedItem!.quantity
                    highlightedItem!.quantity = highlightedItem!.itemInfo.maxStack
                    selectedItem!.quantity = total - highlightedItem!.quantity
                    world.hudInterfaceData.selectedItemInventoryIndex = nil
                }
            }
        }
    }

    func actionCancelGameStateInventory() {
        if world.hudInterfaceData.selectedItemInventoryIndex != nil {
            world.hudInterfaceData.selectedItemInventoryIndex = nil
        } else {
            changeState(to: .Game)
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
