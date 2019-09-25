import SpriteKit

extension ActionControllerGame {
    func actionPrimaryGameStateStore() {
        actionGameStateStoreBuySellItems(quantity: 1, stack: false)
    }

    func actionUseGameStateStore() {
        actionGameStateStoreBuySellItems(quantity: 10, stack: false)
    }
    
    func actionMenuGameStateStore() {
        actionGameStateStoreBuySellItems(quantity: 100, stack: true)
    }

    private func actionGameStateStoreBuySellItems(quantity: Int, stack: Bool) {
        if let storeItemIndex = world.hudInterfaceData.getStoreStoreItemIndex()
            , let storeItem = world.hudInterfaceData.store!.items[storeItemIndex] {
            let item = storeItem.clone()
            item.quantity = quantity
            let cmdPurchaseItem = CmdPurchaseItem(itemToPurchase: item, player: world.player)
            cmdPurchaseItem.execute()
        } else if let playerItemIndex = world.hudInterfaceData.getStorePlayerItemIndex()
            , let playerItem = world.player.inventory.items[playerItemIndex] {
            if stack {
                let cmdSellItem = CmdSellItem(itemToSell: playerItem, quantity: playerItem.quantity, player: world.player)
                cmdSellItem.execute()
            } else {
                let cmdSellItem = CmdSellItem(itemToSell: playerItem, quantity: quantity, player: world.player)
                cmdSellItem.execute()
            }
        }
    }

    func actionCancelGameStateStore() {
        world.hudInterfaceData.store = nil
        changeState(to: .Game)
    }

    func actionDPadUpGameStateStore() {
        world.hudInterfaceData.changeStoreCursorPosition(CGVector(dx:0, dy: 1))
    }

    func actionDPadDownGameStateStore() {
        world.hudInterfaceData.changeStoreCursorPosition(CGVector(dx:0, dy: -1))
    }

    func actionDPadLeftGameStateStore() {
        world.hudInterfaceData.changeStoreCursorPosition(CGVector(dx:-1, dy: 0))
    }

    func actionDPadRightGameStateStore() {
        world.hudInterfaceData.changeStoreCursorPosition(CGVector(dx:1, dy: 0))
    }
}
