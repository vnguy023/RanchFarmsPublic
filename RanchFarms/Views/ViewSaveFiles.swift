import SpriteKit

class ViewSaveFiles: SKNode {
    var saveSlots = [ViewSaveSlot]()

    override init() {
        super.init()

        saveSlots.append(ViewSaveSlot(saveSlot: .Slot1))
        saveSlots.append(ViewSaveSlot(saveSlot: .Slot2))
        saveSlots.append(ViewSaveSlot(saveSlot: .Slot3))

        var index = CGFloat(0)
        let saveSlotStartPosition = CGPoint(x: 0, y: CGFloat(saveSlots.count) * Config.viewSaveSlotSize.height / 2)
        for saveSlot in saveSlots {
            saveSlot.position.x = saveSlotStartPosition.x
            saveSlot.position.y = saveSlotStartPosition.y - index * Config.viewSaveSlotSize.height

            saveSlot.zPosition = 500
            self.addChild(saveSlot)

            if index == 0 {
                saveSlot.setState(.Highlight)
            }

            index += 1
        }
    }

    func update() {}

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
