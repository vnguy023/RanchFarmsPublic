class DeliveryBox {
    private var items = [Item]()

    var count: Int {get {return items.count}}

    init() {}

    func getTotalMoneyIfSold() -> Int {
        return items.map({return $0.getMoneyIfSold()}).reduce(0,+)
    }

    func addItem(_ item: Item) {
        items.append(item.clone())
    }

    func getItems() -> [Item] {
        return items
    }

    func removeAll() {
        items.removeAll()
    }
}
