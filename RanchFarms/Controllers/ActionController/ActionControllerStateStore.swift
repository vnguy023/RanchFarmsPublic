import SpriteKit

extension ActionController {
    func actionPrimaryGameStateStore() {
        if let storeItemIndex = world.hudInterfaceData.getStoreStoreItemIndex()
            , let storeItem = world.hudInterfaceData.store!.items[storeItemIndex] {
            let cmdPurchaseItem = CmdPurchaseItem(itemToPurchase: storeItem.clone(), player: world.player)
            cmdPurchaseItem.execute()
        }
    }

    func actionUseGameStateStore() {
        if let storeItemIndex = world.hudInterfaceData.getStoreStoreItemIndex()
            , let storeItem = world.hudInterfaceData.store!.items[storeItemIndex] {
            let item = storeItem.clone()
            item.quantity = 10
            let cmdPurchaseItem = CmdPurchaseItem(itemToPurchase: item, player: world.player)
            cmdPurchaseItem.execute()
        }
    }

    func actionCancelGameStateStore() {
        changeGameState(to: .Game)
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
