import SpriteKit

extension ActionControllerGame {
    func actionPrimaryGameStateInventory() {
        if world.hudInterfaceData.selectedInventoryCursor == nil {
            if let highlightedItemIndex = world.hudInterfaceData.getInventoryHighlightedItemIndex()
                , world.player.inventory.items[highlightedItemIndex] != nil {
                world.hudInterfaceData.selectedInventoryCursor = world.hudInterfaceData.inventoryCursor
            }
        } else {
            if let selectedItemIndex = world.hudInterfaceData.getInventorySelectedItemIndex() {
                let selectedItem = world.player.inventory.items[selectedItemIndex]
                if selectedItem == nil {return}

                if let highlightedItemIndex = world.hudInterfaceData.getInventoryHighlightedItemIndex() { // moving items
                    // moving items
                    let highlightedItem = world.player.inventory.items[highlightedItemIndex]

                    if world.player.inventory.canAcquire(item: selectedItem!, slot: highlightedItemIndex) {
                        world.player.inventory.acquire(item: selectedItem!, slot: highlightedItemIndex)
                        world.player.inventory.items[selectedItemIndex] = nil
                        world.hudInterfaceData.selectedInventoryCursor = nil
                    } else {
                        if highlightedItem != nil && highlightedItem!.type == selectedItem!.type && highlightedItem!.quantity < highlightedItem!.itemInfo.maxStack{
                            let total = selectedItem!.quantity + highlightedItem!.quantity
                            highlightedItem!.quantity = highlightedItem!.itemInfo.maxStack
                            selectedItem!.quantity = total - highlightedItem!.quantity
                            world.hudInterfaceData.selectedInventoryCursor = nil
                        }
                    }
                } else if world.hudInterfaceData.isInventoryTrashCanHighlighted() {
                    world.player.inventory.items[selectedItemIndex] = nil
                    world.hudInterfaceData.selectedInventoryCursor = nil
                }
            }
        }
    }

    func actionCancelGameStateInventory() {
        if world.hudInterfaceData.selectedInventoryCursor != nil {
            world.hudInterfaceData.selectedInventoryCursor = nil
        } else {
            changeState(to: .Game)
        }
    }

    func actionDPadUpGameStateInventory() {
        world.hudInterfaceData.changeInventoryCursorPosition(CGVector(dx: 0, dy: 1))
    }

    func actionDPadDownGameStateInventory() {
        world.hudInterfaceData.changeInventoryCursorPosition(CGVector(dx: 0, dy: -1))
    }

    func actionDPadLeftGameStateInventory() {
        world.hudInterfaceData.changeInventoryCursorPosition(CGVector(dx: -1, dy: 0))
    }

    func actionDPadRightGameStateInventory() {
        world.hudInterfaceData.changeInventoryCursorPosition(CGVector(dx: 1, dy: 0))
    }
}
