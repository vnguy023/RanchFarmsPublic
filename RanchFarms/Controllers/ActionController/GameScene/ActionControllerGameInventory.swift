import SpriteKit

extension ActionControllerGame {
    func actionPrimaryGameStateInventory() {
        if hudInterfaceData.selectedInventoryCursor == nil {
            if let highlightedItemIndex = hudInterfaceData.getInventoryHighlightedItemIndex()
                , world.player.inventory.items[highlightedItemIndex] != nil {
                hudInterfaceData.selectedInventoryCursor = hudInterfaceData.inventoryCursor
            }
        } else {
            if let selectedItemIndex = hudInterfaceData.getInventorySelectedItemIndex() {
                let selectedItem = world.player.inventory.items[selectedItemIndex]
                if selectedItem == nil {return}

                if let highlightedItemIndex = hudInterfaceData.getInventoryHighlightedItemIndex() { // moving items
                    // moving items
                    let highlightedItem = world.player.inventory.items[highlightedItemIndex]

                    if world.player.inventory.canAcquire(item: selectedItem!, slot: highlightedItemIndex) {
                        world.player.inventory.acquire(item: selectedItem!, slot: highlightedItemIndex)
                        world.player.inventory.items[selectedItemIndex] = nil
                        hudInterfaceData.selectedInventoryCursor = nil
                    } else {
                        if highlightedItem != nil && highlightedItem!.type == selectedItem!.type && highlightedItem!.quantity < highlightedItem!.info.maxStack{
                            let total = selectedItem!.quantity + highlightedItem!.quantity
                            highlightedItem!.quantity = highlightedItem!.info.maxStack
                            selectedItem!.quantity = total - highlightedItem!.quantity
                            hudInterfaceData.selectedInventoryCursor = nil
                        }
                    }
                } else if hudInterfaceData.isInventoryTrashCanHighlighted() {
                    world.player.inventory.items[selectedItemIndex] = nil
                    hudInterfaceData.selectedInventoryCursor = nil
                }
            }
        }
    }

    func actionCancelGameStateInventory() {
        if hudInterfaceData.selectedInventoryCursor != nil {
            hudInterfaceData.selectedInventoryCursor = nil
        } else {
            changeState(to: .Game)
        }
    }

    func actionDPadUpGameStateInventory() {
        hudInterfaceData.changeInventoryCursorPosition(CGVector(dx: 0, dy: 1))
    }

    func actionDPadDownGameStateInventory() {
        hudInterfaceData.changeInventoryCursorPosition(CGVector(dx: 0, dy: -1))
    }

    func actionDPadLeftGameStateInventory() {
        hudInterfaceData.changeInventoryCursorPosition(CGVector(dx: -1, dy: 0))
    }

    func actionDPadRightGameStateInventory() {
        hudInterfaceData.changeInventoryCursorPosition(CGVector(dx: 1, dy: 0))
    }
}
