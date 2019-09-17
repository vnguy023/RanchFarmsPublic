import SpriteKit

class ViewSaveSlot: SKSpriteNode {
    let saveSlot: SaveSlot

    let saveName = SKLabelNode(fontNamed: "Chalkduster")

    enum State {
        case None
        case Highlight
    }

    private var mState = State.None
    var state: State {
        get {return mState}
        set {
            switch newValue {
            case .None:
                texture = TextureManager.shared.getTexture(hudImageName: "hudItemBorder")
            case .Highlight:
                texture = TextureManager.shared.getTexture(hudImageName: "hudItemBorderHighlight")
            }
        }
    }

    init(saveSlot: SaveSlot) {
        self.saveSlot = saveSlot
        super.init(texture: nil, color: .brown, size: Config.viewSaveSlotSize)

        saveName.fontColor = .purple
        saveName.fontSize = 32
        saveName.text = saveSlot.getFileName()
        saveName.zPosition = 1000
        self.addChild(saveName)

        state = .None
    }

    func update() {}

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
