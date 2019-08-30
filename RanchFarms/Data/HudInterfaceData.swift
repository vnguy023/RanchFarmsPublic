// meant to store temporary data for our views
class HudInterfaceData {

    enum GameState {
        case Unknown
        case Game
        case Inventory
    }

    var gameState = GameState.Unknown

    var highlightedItemInventoryHotbarIndex = 0
    let MAX_INVENTORY_HOTBAR_INDEX = Int(Config.viewInventoryColumns - 1)

    var selectedItemInventoryIndex = Int?(nil)
    var highlightedItemInventoryIndex = 0
    
    init() {

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
}
