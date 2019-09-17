import SpriteKit

// meant to store temporary data for our views
class HudInterfaceDataSplash {

    enum State {
        case Unknown
        case Splash
        case SelectSave
    }

    var state = State.Unknown

    var selectSaveCursor = CGPoint(x: 0, y: 2)

    var reloadHud = false

    init() {
    }

    func getSaveSlotSelected() -> SaveSlot? {
        if selectSaveCursor.x == 0 {
            if selectSaveCursor.y == 0 {
                return .Slot3
            } else if selectSaveCursor.y == 1 {
                return .Slot2
            } else if selectSaveCursor.y == 2 {
                return .Slot1
            }
        }

        return nil
    }

    func getTrashSlotSelected() -> SaveSlot? {
        if selectSaveCursor.x == 1 {
            if selectSaveCursor.y == 0 {
                return .Slot3
            } else if selectSaveCursor.y == 1 {
                return .Slot2
            } else if selectSaveCursor.y == 2 {
                return .Slot1
            }
        }

        return nil
    }

    func changeSelectSaveCursor(_ value: CGVector) {
        selectSaveCursor = selectSaveCursor + value
        selectSaveCursor.x = max(0, selectSaveCursor.x)
        selectSaveCursor.x = min(selectSaveCursor.x, 1)

        selectSaveCursor.y = max(0, selectSaveCursor.y)
        selectSaveCursor.y = min(selectSaveCursor.y, CGFloat(Config.SaveSlotCount) - 1)
    }
}
