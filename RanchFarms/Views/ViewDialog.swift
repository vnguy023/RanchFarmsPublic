import SpriteKit

class ViewDialog: SKNode {
    private let world: World

    private var dialog: Dialog!{
        get {return world.hudInterfaceData.dialog}
    }

    let size = Config.viewDialogSize

    let textLabel = SKLabelNode(fontNamed: "ChalkDuster")

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
        textLabel.verticalAlignmentMode = .top
        textLabel.fontSize = 24
        textLabel.fontColor = .white
        textLabel.zPosition = 100
        textLabel.position = CGPoint(x: self.size.width / -2 + background.cornerSize.width,
                                     y: self.size.height / 2 - background.cornerSize.height)
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
    }

    func update() {
        if dialog == nil {
            print ("[ViewDialog] [Desc=attempting to update without valid object]")
            return
        }

        textLabel.text = dialog.text

        portrait.texture = TextureManager.shared.getTexture(portraitId: dialog.portraitId)
        portraitName.text = dialog.portraitName
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
