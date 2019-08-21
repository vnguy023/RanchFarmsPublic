import SpriteKit

class Inventory {
    var items = [Item?]() // position: Item

    var capacity = 10

    init() {
        for _ in 0 ..< capacity {
            items.append(nil)
        }
    }
}
