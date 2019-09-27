import SpriteKit

class DialogManager {
    static let shared = DialogManager()

    private var dialogMap = [DialogId: Dialog]()

    private init() {
        GameData.getDialogs().forEach({dialogMap[$0.id] = $0})
    }

    func getDialog(dialogId: DialogId) -> Dialog? {
        if let dialog = dialogMap[dialogId] {
            return dialog
        }

        print ("[DialogManager] [Desc=Info not found] [BuildingId=\(dialogId)]")
        return nil
    }
}
