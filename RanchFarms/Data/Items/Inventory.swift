import SpriteKit

class Inventory {
    var items = [Item?]() // position: Item

    var capacity = Config.viewInventoryWidth

    init() {
        for _ in 0 ..< Int(capacity) {
            items.append(nil)
        }
    }
}
