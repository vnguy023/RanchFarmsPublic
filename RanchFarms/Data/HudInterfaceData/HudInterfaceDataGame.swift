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

    var state = State.Game

    var dialog: Dialog? = nil
    var currentDialogSectionIndex = 0
    var currentDialogOptionIndex = 0

    var hotbarCursor = CGPoint()

    var inventoryCursor = CGPoint(x: 0, y: 2) // (0,0) is bottom left most option
    var selectedInventoryCursor: CGPoint? = nil

    var store: Store? = nil
    var storeCursor = CGPoint(x: 0, y: 2) // (0,0) is bottom left most option
    
    init() { }

    func changeHotBarCursorPosition(_ value: CGVector) {
        hotbarCursor = hotbarCursor + value
        hotbarCursor.x = max(0, hotbarCursor.x)
        hotbarCursor.x = min(hotbarCursor.x, Config.viewInventoryColumns - 1)

        hotbarCursor.y = 0
    }

    func getHotBarItemIndex() -> Int? {
        return Int(hotbarCursor.x)
    }

    func changeInventoryCursorPosition(_ value: CGVector) {
        inventoryCursor = inventoryCursor + value
        inventoryCursor.x = max(0, inventoryCursor.x)
        inventoryCursor.x = min(inventoryCursor.x, CGFloat(Config.viewInventoryColumns - 1) + 1)

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
        if inventoryCursor.x < Config.viewInventoryColumns {
            if Int(inventoryCursor.y) == 0 && inventoryCursor.x < Config.viewInventoryColumns {
                return Int(inventoryCursor.x) + Int(Config.viewInventoryColumns * 2)
            } else if Int(inventoryCursor.y) == 1 && inventoryCursor.x < Config.viewInventoryColumns {
                return Int(inventoryCursor.x) + Int(Config.viewInventoryColumns * 1)
            } else if Int(inventoryCursor.y) == 2 && inventoryCursor.x < Config.viewInventoryColumns {
                return Int(inventoryCursor.x) + Int(Config.viewInventoryColumns * 0)
            }
        }

        return nil
    }

    func getInventorySelectedItemIndex() -> Int? {
        if selectedInventoryCursor == nil {
            return nil
        }

        if selectedInventoryCursor!.x < Config.viewInventoryColumns {
            if Int(selectedInventoryCursor!.y) == 0 && selectedInventoryCursor!.x < Config.viewInventoryColumns {
                return Int(selectedInventoryCursor!.x) + Int(Config.viewInventoryColumns * 2)
            } else if Int(selectedInventoryCursor!.y) == 1 && selectedInventoryCursor!.x < Config.viewInventoryColumns {
                return Int(selectedInventoryCursor!.x) + Int(Config.viewInventoryColumns * 1)
            } else if Int(selectedInventoryCursor!.y) == 2 && selectedInventoryCursor!.x < Config.viewInventoryColumns {
                return Int(selectedInventoryCursor!.x) + Int(Config.viewInventoryColumns * 0)
            }
        }

        return nil
    }

    func isInventoryTrashCanHighlighted() -> Bool {
        if inventoryCursor.x < Config.viewInventoryColumns {
            return false
        }
        return true
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
