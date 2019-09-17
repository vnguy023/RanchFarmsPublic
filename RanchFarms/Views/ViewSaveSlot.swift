import SpriteKit

class ViewSaveSlot: SKSpriteNode {
    let saveSlot: SaveSlot

    let saveName = SKLabelNode(fontNamed: "Chalkduster")

    enum State {
        case None
        case Highlight
    }

    init(saveSlot: SaveSlot) {
        self.saveSlot = saveSlot
        super.init(texture: nil, color: .brown, size: Config.viewSaveSlotSize)

        saveName.fontColor = .purple
        saveName.fontSize = 32
        saveName.text = saveSlot.getFileName()
        saveName.zPosition = 1000
        self.addChild(saveName)

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
