class CmdSellItem: Command {
    let itemToSell: Item
    let player: Person
    let quantity: Int

    init(itemToSell: Item, quantity: Int, player: Person) {
        self.itemToSell = itemToSell
        self.player = player
        self.quantity = quantity

    }

    func execute() {
        if itemToSell.info.canSell && player.inventory.canDeleteItem(item: itemToSell, quantity: quantity) {
            player.inventory.deleteItem(item: itemToSell, quantity: quantity)
            player.money += itemToSell.getMoneyIfSold()
        }
    }
}
