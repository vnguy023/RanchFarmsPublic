import SpriteKit

// meant to store temporary data for our views
class HudInterfaceData {

    enum GameState {
        case Unknown
        case Dialog
        case Game
        case Inventory
        case Store
    }

    var gameState = GameState.Unknown

    var highlightedItemInventoryHotbarIndex = 0
    let MAX_INVENTORY_HOTBAR_INDEX = Int(Config.viewInventoryColumns - 1)

    var selectedItemInventoryIndex = Int?(nil)
    var highlightedItemInventoryIndex = 0

    var storeCursor = CGPoint() // (0,0) is bottom left most option

    var store: Store?
    
    init() {
        store = Store(storeFrontId: .VendingMachine, storeCatalogId: .VendingMachine)
    }

    func changeHotBarIndexLeft() {
        highlightedItemInventoryHotbarIndex = max(highlightedItemInventoryHotbarIndex - 1, 0)
    }

    func changeHotBarIndexRight() {
        highlightedItemInventoryHotbarIndex = min(highlightedItemInventoryHotbarIndex + 1, MAX_INVENTORY_HOTBAR_INDEX)
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

    func changeStoreCursorPosition(vector: CGVector) {
        storeCursor = storeCursor + vector
        storeCursor.x = max(0, storeCursor.x)
        storeCursor.x = min(storeCursor.x, CGFloat(Config.viewStoreItemColumns-1))

        storeCursor.y = max(0, storeCursor.y)
        storeCursor.y = min(storeCursor.y, CGFloat(Config.viewStoreItemRows) * 2 - 1)
    }
}
