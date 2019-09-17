import SpriteKit

class ViewSaveDelete: SKSpriteNode {
    let trashSprite: SKSpriteNode!

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

    init() {
        trashSprite = SKSpriteNode(texture: nil, color: .clear, size: CGSize(width: Config.viewSaveSlotSize.height*3/4,
                                                                             height: Config.viewSaveSlotSize.height*3/4))

        super.init(texture: nil,
                   color: .brown,
                   size: CGSize(width: Config.viewSaveSlotSize.height,
                                height: Config.viewSaveSlotSize.height))

        trashSprite.texture = TextureManager.shared.getTexture(hudImageName: "hudTrashCan")
        trashSprite.zPosition = 1000
        self.addChild(trashSprite)

        state = .None
    }

    func update() {}

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
