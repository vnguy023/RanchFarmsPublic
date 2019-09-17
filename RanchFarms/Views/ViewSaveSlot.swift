import SpriteKit

class ViewSaveSlot: SKSpriteNode {
    let saveSlot: SaveSlot

    enum State {
        case None
        case Highlight
    }

    init(saveSlot: SaveSlot) {
        self.saveSlot = saveSlot
        super.init(texture: nil, color: .brown, size: Config.viewSaveSlotSize)

        setState(State.None)
    }

    func update() {}

    func setState(_ state: State) {
        switch state {
        case .None:
            texture = TextureManager.shared.getTexture(hudImageName: "hudItemBorder")
        case .Highlight:
            texture = TextureManager.shared.getTexture(hudImageName: "hudItemBorderHighlight")
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
