import SpriteKit

class Inventory {
    var items = [Item?]() // position: Item

    var capacity = Config.viewInventoryColumns * Config.viewInventoryRows

    init() {
        for _ in 0 ..< Int(capacity) {
            items.append(nil)
        }
    }

    // TODO: how to solve this given we have multiple stacks we can fill at once
    func canAcquire(item: Item) -> Bool {
        for i in 0..<Int(capacity) {
            if canAcquire(item: item, slot: i) {
                return true
            }
        }

        return false
    }

    func canAcquire(item: Item, slot: Int) -> Bool {
        if let currentItemInSlot = items[slot] {
            if currentItemInSlot.type != item.type
                || currentItemInSlot.quantity + item.quantity > currentItemInSlot.itemInfo.maxStack {
                return false
            }
        }
        return true
    }

    func acquire(item: Item) {
        for i in 0..<Int(capacity) {
            if canAcquire(item: item, slot: i) {
                acquire(item: item, slot: i)
                return
            }
        }
    }

    func acquire(item: Item, slot: Int) {
        if canAcquire(item: item, slot: slot) {
            if let currentItemInSlot = items[slot] {
                currentItemInSlot.quantity += item.quantity
            } else {
                items[slot] = item
            }
        }
    }
}
