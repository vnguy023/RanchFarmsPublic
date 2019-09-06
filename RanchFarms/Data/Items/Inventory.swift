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
        // see if we can stack first
        for i in 0..<Int(capacity) {
            if canAcquire(item: item, slot: i)
                && items[i] != nil && items[i]!.type == item.type {
                acquire(item: item, slot: i)
                return
            }
        }

        // can't stack so therefore take first empty slot
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
                items[slot] = item.clone()
            }
        }
    }

    func deleteItem(item: Item) {
        for i in 0..<Int(capacity) {
            if items[i] === item {
                items[i] = nil
            }
        }
    }

    func canDeleteItem(item: Item, quantity: Int) -> Bool {
        for i in 0..<Int(capacity) {
            if items[i] === item && quantity <= item.quantity {
                return true
            }
        }

        return false
    }

    func deleteItem(item: Item, quantity: Int) {
        if !canDeleteItem(item: item, quantity: quantity) {
            return
        }

        for i in 0..<Int(capacity) {
            if items[i] === item {
                if quantity < item.quantity {
                    item.quantity -= quantity
                } else {
                    items[i] = nil
                }
            }
        }
    }
}
