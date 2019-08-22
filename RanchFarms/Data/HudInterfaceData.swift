// meant to store temporary data for our views
class HudInterfaceData {

    var selectedItemInventoryHotbarIndex = 0
    let MAX_INVENTORY_HOTBAR_INDEX = 9
    
    init() {

    }

    func changeHotBarIndexLeft() {
        selectedItemInventoryHotbarIndex = max(selectedItemInventoryHotbarIndex - 1, 0)
    }

    func changeHotBarIndexRight() {
        selectedItemInventoryHotbarIndex = min(selectedItemInventoryHotbarIndex + 1, MAX_INVENTORY_HOTBAR_INDEX)
    }
}
