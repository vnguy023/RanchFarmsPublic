// meant to store temporary data for our views
class HudInterfaceData {

    enum GameState {
        case Unknown
        case Game
        case Inventory
    }

    var gameState = GameState.Unknown

    var selectedItemInventoryHotbarIndex = 0
    let MAX_INVENTORY_HOTBAR_INDEX = Int(Config.viewInventoryWidth - 1)
    
    init() {

    }

    func changeHotBarIndexLeft() {
        selectedItemInventoryHotbarIndex = max(selectedItemInventoryHotbarIndex - 1, 0)
    }

    func changeHotBarIndexRight() {
        selectedItemInventoryHotbarIndex = min(selectedItemInventoryHotbarIndex + 1, MAX_INVENTORY_HOTBAR_INDEX)
    }
}
