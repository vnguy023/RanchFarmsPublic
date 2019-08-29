// meant to store temporary data for our views
class HudInterfaceData {

    enum GameState {
        case Unknown
        case Game
        case Inventory
    }

    var gameState = GameState.Unknown

    var selectedItemInventoryHotbarIndex = 0
    let MAX_INVENTORY_HOTBAR_INDEX = Int(Config.viewInventoryColumns - 1)

    var selectedItemInventoryIndex = 0
    
    init() {

    }

    func changeHotBarIndexLeft() {
        selectedItemInventoryHotbarIndex = max(selectedItemInventoryHotbarIndex - 1, 0)
    }

    func changeHotBarIndexRight() {
        selectedItemInventoryHotbarIndex = min(selectedItemInventoryHotbarIndex + 1, MAX_INVENTORY_HOTBAR_INDEX)
    }

    func changeInventoryIndexUp() {
        if selectedItemInventoryIndex >= Int(Config.viewInventoryColumns) {
            selectedItemInventoryIndex -= Int(Config.viewInventoryColumns)
        }
    }

    func changeInventoryIndexDown() {
        if selectedItemInventoryIndex < Int(Config.viewInventoryColumns * (Config.viewInventoryRows - 1)) {
            selectedItemInventoryIndex += Int(Config.viewInventoryColumns)
        }
    }

    func changeInventoryIndexLeft() {
        if (selectedItemInventoryIndex % Int(Config.viewInventoryColumns)) > 0 {
            selectedItemInventoryIndex -= 1
        }
    }

    func changeInventoryIndexRight() {
        if (selectedItemInventoryIndex % Int(Config.viewInventoryColumns)) < Int(Config.viewInventoryColumns) - 1 {
            selectedItemInventoryIndex += 1
        }
    }
}
