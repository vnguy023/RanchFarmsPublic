import SpriteKit

class ViewSaveFiles: SKNode {
    let hudInterfaceData: HudInterfaceDataSplash

    var saveSlot1 = ViewSaveSlot(saveSlot: .Slot1)
    var saveSlot2 = ViewSaveSlot(saveSlot: .Slot2)
    var saveSlot3 = ViewSaveSlot(saveSlot: .Slot3)

    var trashSlot1 = ViewSaveDelete()
    var trashSlot2 = ViewSaveDelete()
    var trashSlot3 = ViewSaveDelete()

    init(hudInterfaceDataSplash: HudInterfaceDataSplash) {
        self.hudInterfaceData = hudInterfaceDataSplash

        super.init()

        var saveSlots = [ViewSaveSlot]()
        saveSlots.append(saveSlot1)
        saveSlots.append(saveSlot2)
        saveSlots.append(saveSlot3)

        var trashSlots = [ViewSaveDelete]()
        trashSlots.append(trashSlot1)
        trashSlots.append(trashSlot2)
        trashSlots.append(trashSlot3)

        let saveSlotStartPosition = CGPoint(x: 0, y: CGFloat(saveSlots.count) * Config.viewSaveSlotSize.height / 2)
        for index in 0...2 {
            saveSlots[index].position.x = saveSlotStartPosition.x
            saveSlots[index].position.y = saveSlotStartPosition.y - CGFloat(index) * Config.viewSaveSlotSize.height
            saveSlots[index].zPosition = 500
            self.addChild(saveSlots[index])

            trashSlots[index].position.x = saveSlotStartPosition.x + Config.viewSaveSlotSize.width/2 + trashSlots[index].size.width/2
            trashSlots[index].position.y = saveSlots[index].position.y
            trashSlots[index].zPosition = 500
            self.addChild(trashSlots[index])
        }
    }

    func update() {
        saveSlot1.state = .None
        saveSlot2.state = .None
        saveSlot3.state = .None

        trashSlot1.state = .None
        trashSlot2.state = .None
        trashSlot3.state = .None

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

        if let trashSlotSelected = hudInterfaceData.getTrashSlotSelected() {
            switch trashSlotSelected {
            case .Slot1:
                trashSlot1.state = .Highlight
            case .Slot2:
                trashSlot2.state = .Highlight
            case .Slot3:
                trashSlot3.state = .Highlight
            }
        }
    }

    func reload() {
        saveSlot1.reload()
        saveSlot2.reload()
        saveSlot3.reload()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
