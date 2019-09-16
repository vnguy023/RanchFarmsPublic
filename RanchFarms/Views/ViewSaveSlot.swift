import SpriteKit

class ViewSaveSlot: SKSpriteNode {
    let saveSlot: SaveSlot

    init(saveSlot: SaveSlot) {
        self.saveSlot = saveSlot
        super.init(texture: nil, color: .brown, size: Config.viewSaveSlotSize)

        // Temporary
        texture = TextureManager.shared.getTexture(hudImageName: "hudItemBorder")
    }

    func update() {}

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
