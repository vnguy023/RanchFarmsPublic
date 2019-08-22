import SpriteKit

class Inventory {
    var items = [Item?]() // position: Item

    var capacity = 10

    var hotBarSelectedIndex = 0
    let MAX_HOTBAR_INDEX_VALUE = 9

    init() {
        for _ in 0 ..< capacity {
            items.append(nil)
        }
    }

    func changeHotBarIndexLeft() {
        hotBarSelectedIndex = max(hotBarSelectedIndex - 1, 0)
    }

    func changeHotBarIndexRight() {
        hotBarSelectedIndex = min(hotBarSelectedIndex + 1, MAX_HOTBAR_INDEX_VALUE)
    }
}
