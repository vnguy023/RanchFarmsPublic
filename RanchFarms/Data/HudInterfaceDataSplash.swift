import SpriteKit

// meant to store temporary data for our views
class HudInterfaceDataSplash {

    enum State {
        case Unknown
        case Splash
        case SelectSave
    }

    var state = State.Unknown

    var selectSaveCursor = CGPoint()
    
    init() {
    }

    func getSaveSlotSelected() -> SaveSlot? {
        return SaveSlot.Slot1

        //return nil
    }
}
