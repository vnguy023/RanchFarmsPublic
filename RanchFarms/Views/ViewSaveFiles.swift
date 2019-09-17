import SpriteKit

class ViewSaveFiles: SKNode {
    let hudInterfaceData: HudInterfaceDataSplash

    var saveSlot1 = ViewSaveSlot(saveSlot: .Slot1)
    var saveSlot2 = ViewSaveSlot(saveSlot: .Slot2)
    var saveSlot3 = ViewSaveSlot(saveSlot: .Slot3)

    init(hudInterfaceDataSplash: HudInterfaceDataSplash) {
        self.hudInterfaceData = hudInterfaceDataSplash

        super.init()

        var saveSlots = [ViewSaveSlot]()
        saveSlots.append(saveSlot1)
        saveSlots.append(saveSlot2)
        saveSlots.append(saveSlot3)

        var index = CGFloat(0)
        let saveSlotStartPosition = CGPoint(x: 0, y: CGFloat(saveSlots.count) * Config.viewSaveSlotSize.height / 2)
        for saveSlot in saveSlots {
            saveSlot.position.x = saveSlotStartPosition.x
            saveSlot.position.y = saveSlotStartPosition.y - index * Config.viewSaveSlotSize.height

            saveSlot.zPosition = 500
            self.addChild(saveSlot)

            index += 1
        }
    }

    func update() {
        saveSlot1.state = .None
        saveSlot2.state = .None
        saveSlot3.state = .None

        if let saveSlotSelected = hudInterfaceData.getSaveSlotSelected() {
            switch saveSlotSelected {
            case .Slot1:
                saveSlot1.state = .Highlight
            case .Slot2:
                saveSlot2.state = .Highlight
            case .Slot3:
                saveSlot3.state = .Highlight
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
