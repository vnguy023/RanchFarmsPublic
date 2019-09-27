import SpriteKit

class ViewDialog: SKSpriteNode {
    private let world: World

    private var dialog: Dialog!{
        get {return world.hudInterfaceData.dialog}
    }

    let textLabel = SKLabelNode(fontNamed: "ChalkDuster")

    let portrait = SKSpriteNode(color: .clear, size: Config.viewDialogPortraitSize)

    init(world: World) {
        self.world = world

        super.init(texture: nil, color: .blue, size: Config.viewDialogSize)

        //texture = TextureManager.shared.getTexture(hudImageName: "hudTileCursor")

        textLabel.horizontalAlignmentMode = .center
        textLabel.verticalAlignmentMode = .center
        textLabel.fontSize = 24
        textLabel.fontColor = .white
        textLabel.zPosition = 100
        self.addChild(textLabel)

        portrait.position = CGPoint(x: self.size.width / 2 - portrait.size.width/2,
                                    y: 0)
        portrait.zPosition = 100
        self.addChild(portrait)

        update()
    }

    func update() {
        if dialog == nil {
            print ("[ViewDialog] [Desc=attempting to update without valid object]")
            return
        }

        textLabel.text = dialog.text

        portrait.texture = TextureManager.shared.getTexture(portraitId: dialog.portraitId)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
