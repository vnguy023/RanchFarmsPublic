class CmdPurchaseItem: Command {
    let itemToPurchase: Item
    let player: Person

    init(itemToPurchase: Item, player: Person) {
        self.itemToPurchase = itemToPurchase
        self.player = player
    }

    func execute() {
        let costOfItems = itemToPurchase.quantity * itemToPurchase.itemInfo.purchasePrice

        if player.money >= costOfItems
            && player.inventory.canAcquire(item: itemToPurchase) {
            player.inventory.acquire(item: itemToPurchase)
            player.money -= costOfItems
        }
    }
}
