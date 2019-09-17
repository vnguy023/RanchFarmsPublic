import SpriteKit

class ViewSaveSlot: SKSpriteNode {
    let saveSlot: SaveSlot

    // successful load of saveSlot
    let nodeSuccess = SKNode()
    let saveName = SKLabelNode(fontNamed: "Chalkduster")
    let days = SKLabelNode(fontNamed: "Chalkduster")
    let money = SKLabelNode(fontNamed: "Chalkduster")

    // saveSlot loadError
    let nodeError = SKNode()
    let message = SKLabelNode(fontNamed: "Chalkduster")

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

        self.addChild(nodeSuccess)
        self.addChild(nodeError)

        saveName.fontColor = .purple
        saveName.fontSize = 32
        saveName.horizontalAlignmentMode = .left
        saveName.verticalAlignmentMode = .top
        saveName.position = CGPoint(x: self.size.width / -2 + 10,
                                    y: self.size.height / 2 - 10)
        saveName.zPosition = 1000
        nodeSuccess.addChild(saveName)

        days.fontColor = .blue
        days.fontSize = 32
        days.horizontalAlignmentMode = .right
        days.verticalAlignmentMode = .top
        days.position = CGPoint(x: self.size.width / 2 - 10,
                                y: self.size.height / 2 - 10)
        days.zPosition = 1000
        nodeSuccess.addChild(days)

        money.fontColor = .black
        money.fontSize = 32
        money.horizontalAlignmentMode = .right
        money.verticalAlignmentMode = .bottom
        money.position = CGPoint(x: self.size.width / 2 - 10,
                                 y: self.size.height / -2 + 10)
        money.zPosition = 1000
        nodeSuccess.addChild(money)

        message.fontColor = .black
        message.fontSize = 64
        message.zPosition = 1000
        nodeError.addChild(message)

        state = .None

        reload()
    }

    func update() {}

    func reload() {
        nodeSuccess.isHidden = true
        nodeError.isHidden = true

        let cmd = CmdGetSaveDataInfo(saveSlot: saveSlot)
        cmd.execute()

        switch cmd.result {
        case .Success:
            nodeSuccess.isHidden = false

            saveName.text = "Name: \(saveSlot.getFileName())"
            money.text = "$\(cmd.saveDataInfo.money)"
            days.text = "Day: \(cmd.saveDataInfo.daysElapsed + 1)"
        case .SaveFileNotCompatible:
            nodeError.isHidden = false

            message.text = "Corrupted Save File"
        case .NoSaveFile:
            nodeError.isHidden = false

            message.text = "Empty Slot"
        default:
            print ("[ViewSaveSlot] [Reload] [Desc=Load result not handled] [Result\(cmd.result)] [saveSlot=\(saveSlot)]")
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
