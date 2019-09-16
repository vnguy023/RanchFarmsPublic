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

    var selectedItemInventoryIndex = Int?(nil)
    var highlightedItemInventoryIndex = 0

    var storeCursor = CGPoint() // (0,0) is bottom left most option

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

    func changeInventoryIndexUp() {
        if highlightedItemInventoryIndex >= Int(Config.viewInventoryColumns) {
            highlightedItemInventoryIndex -= Int(Config.viewInventoryColumns)
        }
    }

    func changeInventoryIndexDown() {
        if highlightedItemInventoryIndex < Int(Config.viewInventoryColumns * (Config.viewInventoryRows - 1)) {
            highlightedItemInventoryIndex += Int(Config.viewInventoryColumns)
        }
    }

    func changeInventoryIndexLeft() {
        if (highlightedItemInventoryIndex % Int(Config.viewInventoryColumns)) > 0 {
            highlightedItemInventoryIndex -= 1
        }
    }

    func changeInventoryIndexRight() {
        if (highlightedItemInventoryIndex % Int(Config.viewInventoryColumns)) < Int(Config.viewInventoryColumns) - 1 {
            highlightedItemInventoryIndex += 1
        }
    }

    func getInventorySelectedItemIndex() -> Int? {
        return selectedItemInventoryIndex
    }

    func getInventoryHighlightedItemIndex() -> Int? {
        return highlightedItemInventoryIndex
    }

    func changeStoreCursorPosition(_ value: CGVector) {
        storeCursor = storeCursor + value
        storeCursor.x = max(0, storeCursor.x)
        storeCursor.x = min(storeCursor.x, CGFloat(Config.viewStoreItemColumns-1))

        storeCursor.y = max(0, storeCursor.y)
        storeCursor.y = min(storeCursor.y, CGFloat(Config.viewStoreItemRows) * 2 - 1)
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
