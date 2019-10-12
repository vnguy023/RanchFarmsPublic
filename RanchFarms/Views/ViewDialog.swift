import SpriteKit

class ViewDialog: SKNode {
    private let world: World

    private var dialog: Dialog!{
        get {return world.hudInterfaceData.dialog}
    }

    private var currentSection: DialogSection! {
        get {return world.hudInterfaceData.dialog!.sections[world.hudInterfaceData.currentDialogSectionIndex]}
    }

    let size = Config.viewDialogSize

    let textLabel = SKLabelNode(fontNamed: "ChalkDuster")

    var optionLabels = [SKLabelNode]()
    var optionCursor = SKSpriteNode(color: .white, size: CGSize(width: 16, height: 16))

    let background = SpriteNodeNine(size: Config.viewDialogSize)
    let portrait = SKSpriteNode(color: .clear, size: Config.viewDialogPortraitSize)
    let portraitName = SKLabelNode(fontNamed: "ChalkDuster")

    init(world: World) {
        self.world = world

        super.init()

        //texture = TextureManager.shared.getTexture(hudImageName: "hudTileCursor")

        background.texture = TextureManager.shared.getTexture(hudImageName: "hudDialogBackground")
        self.addChild(background)

        textLabel.horizontalAlignmentMode = .left
        textLabel.verticalAlignmentMode = .center
        textLabel.fontSize = 24
        textLabel.fontColor = .white
        textLabel.zPosition = 100
        textLabel.position = linePosition(lineNo: 0)
        self.addChild(textLabel)

        portrait.size = CGSize(width: size.height - background.cornerSize.height*2 - 24 * 2,
                               height: size.height - background.cornerSize.height*2 - 24 * 2)
        portrait.position = CGPoint(x: self.size.width / 2 - background.cornerSize.width/2 - portrait.size.width/2 - 48,
                                    y: 24)
        portrait.zPosition = 100
        self.addChild(portrait)

        portraitName.horizontalAlignmentMode = .center
        portraitName.verticalAlignmentMode = .bottom
        portraitName.fontSize = 24
        portraitName.fontColor = .white
        portraitName.zPosition = 100
        portraitName.position = CGPoint(x: self.size.width / 2 - background.cornerSize.width/2 - portrait.size.width/2 - 48,
                                        y: self.size.height / -2 + background.cornerSize.height)
        self.addChild(portraitName)

        optionCursor.zPosition = 100
        self.addChild(optionCursor)
    }

    func update() {
        if dialog == nil {
            print ("[ViewDialog] [Desc=attempting to update without valid object]")
            return
        }

        textLabel.text = currentSection.text
        portrait.texture = TextureManager.shared.getTexture(portraitId: currentSection.portraitId)
        portraitName.text = currentSection.portraitName

        optionCursor.isHidden = true
        displayOptions()
    }

    private func displayOptions() {
        optionLabels.forEach({$0.removeFromParent()})
        optionLabels.removeAll()

        for option in currentSection.dialogOptions {
            // one is for the textLabel
            let lineNo = optionLabels.count + 1

            if option === currentSection.dialogOptions[world.hudInterfaceData.currentDialogOptionIndex] {
                optionCursor.isHidden = false
                optionCursor.position = linePosition(lineNo: lineNo)
                optionCursor.position.x += 16 // small adjustment for now
            }

            let optionLabel = SKLabelNode(fontNamed: "Chalkduster")
            optionLabel.horizontalAlignmentMode = .left
            optionLabel.verticalAlignmentMode = .center
            optionLabel.fontSize = textLabel.fontSize
            optionLabel.fontColor = .white
            optionLabel.zPosition = 100
            optionLabel.position = linePosition(lineNo: lineNo, isDialogOption: true)
            optionLabel.text = option.text

            self.addChild(optionLabel)
            optionLabels.append(optionLabel)
        }
    }

    // Assumption: fontSize is static, text is vertically aligned .center, text is horizontally aligned left
    // as lineNo goes Up postion goes down
    private func linePosition(lineNo: Int, isDialogOption: Bool = false) -> CGPoint {
        var result = CGPoint(x: self.size.width / -2 + background.cornerSize.width,
                             y: self.size.height / 2 - background.cornerSize.height - textLabel.fontSize / 2 - 8)

        if isDialogOption {
            result.x += 32
        }

        // Fontsize + extra spacing
        let vertSpacingPerLine = 24 + 8
        result.y -= CGFloat(vertSpacingPerLine * lineNo)

        return result
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
