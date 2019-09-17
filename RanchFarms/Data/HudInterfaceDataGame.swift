import SpriteKit

// meant to store temporary data for our views
class HudInterfaceDataGame {

    enum State {
        case Unknown
        case Dialog
        case Game
        case Inventory
        case Store
    }

    var state = State.Unknown

    var hotbarCursor = Int(0)

    var storeCursor = CGPoint() // (0,0) is bottom left most option

    var inventoryCursor = CGPoint(x: 0, y: 2) // (0,0) is bottom left most option
    var selectedInventoryCursor: CGPoint? = nil

    var store: Store?
    
    init() {
        store = Store(storeFrontId: .VendingMachine, storeCatalogId: .VendingMachine)
    }

    func changeHotBarCursorPosition(_ value: Int) {
        hotbarCursor = hotbarCursor + value
        hotbarCursor = max(0, hotbarCursor)
        hotbarCursor = min(hotbarCursor, Int(Config.viewInventoryColumns) - 1)
    }

    func getHotBarItemIndex() -> Int? {
        return hotbarCursor
    }

    func changeInventoryCursorPosition(_ value: CGVector) {
        inventoryCursor = inventoryCursor + value
        inventoryCursor.x = max(0, inventoryCursor.x)
        inventoryCursor.x = min(inventoryCursor.x, CGFloat(Config.viewInventoryColumns - 1))

        inventoryCursor.y = max(0, inventoryCursor.y)
        inventoryCursor.y = min(inventoryCursor.y, CGFloat(Config.viewInventoryRows - 1))
    }

    func changeStoreCursorPosition(_ value: CGVector) {
        storeCursor = storeCursor + value
        storeCursor.x = max(0, storeCursor.x)
        storeCursor.x = min(storeCursor.x, CGFloat(Config.viewStoreItemColumns-1))

        storeCursor.y = max(0, storeCursor.y)
        storeCursor.y = min(storeCursor.y, CGFloat(Config.viewStoreItemRows) * 2 - 1)
    }

    func getInventoryHighlightedItemIndex() -> Int? {
        if Int(inventoryCursor.y) == 0 && inventoryCursor.x < Config.viewInventoryColumns {
            return Int(inventoryCursor.x) + Int(Config.viewInventoryColumns * 2)
        } else if Int(inventoryCursor.y) == 1 && inventoryCursor.x < Config.viewInventoryColumns {
            return Int(inventoryCursor.x) + Int(Config.viewInventoryColumns * 1)
        } else if Int(inventoryCursor.y) == 2 && inventoryCursor.x < Config.viewInventoryColumns {
            return Int(inventoryCursor.x) + Int(Config.viewInventoryColumns * 0)
        }

        return nil
    }

    func getInventorySelectedItemIndex() -> Int? {
        if selectedInventoryCursor == nil {
            return nil
        }

        if Int(selectedInventoryCursor!.y) == 0 && selectedInventoryCursor!.x < Config.viewInventoryColumns {
            return Int(selectedInventoryCursor!.x) + Int(Config.viewInventoryColumns * 2)
        } else if Int(selectedInventoryCursor!.y) == 1 && selectedInventoryCursor!.x < Config.viewInventoryColumns {
            return Int(selectedInventoryCursor!.x) + Int(Config.viewInventoryColumns * 1)
        } else if Int(selectedInventoryCursor!.y) == 2 && selectedInventoryCursor!.x < Config.viewInventoryColumns {
            return Int(selectedInventoryCursor!.x) + Int(Config.viewInventoryColumns * 0)
        }

        return nil
    }

    func getStorePlayerItemIndex() -> Int? {
        if Int(storeCursor.y) == 0 && storeCursor.x < Config.viewInventoryColumns {
            return Int(storeCursor.x) + Int(Config.viewInventoryColumns * 2)
        } else if Int(storeCursor.y) == 1 && storeCursor.x < Config.viewInventoryColumns {
            return Int(storeCursor.x) + Int(Config.viewInventoryColumns * 1)
        } else if Int(storeCursor.y) == 2 && storeCursor.x < Config.viewInventoryColumns {
            return Int(storeCursor.x) + Int(Config.viewInventoryColumns * 0)
        }

        return nil
    }

    func getStoreStoreItemIndex() -> Int? {
        if Int(storeCursor.y) == 3 && storeCursor.x < Config.viewInventoryColumns {
            return Int(storeCursor.x) + Int(Config.viewInventoryColumns * 2)
        } else if Int(storeCursor.y) == 4 && storeCursor.x < Config.viewInventoryColumns {
            return Int(storeCursor.x) + Int(Config.viewInventoryColumns * 1)
        } else if Int(storeCursor.y) == 5 && storeCursor.x < Config.viewInventoryColumns {
            return Int(storeCursor.x) + Int(Config.viewInventoryColumns * 0)
        }

        return nil
    }
}
