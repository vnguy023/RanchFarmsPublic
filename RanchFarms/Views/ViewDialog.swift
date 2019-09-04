import SpriteKit

class ViewDialog: SKSpriteNode {
    let textLabel = SKLabelNode(fontNamed: "ChalkDuster")

    init() {
        super.init(texture: nil, color: .blue, size: Config.viewDialogSize)

        //texture = TextureManager.shared.getTexture(hudImageName: "hudTileCursor")

        textLabel.horizontalAlignmentMode = .center
        textLabel.verticalAlignmentMode = .center
        textLabel.fontSize = 24
        textLabel.fontColor = .white
        textLabel.zPosition = 100
        self.addChild(textLabel)

        update()
    }

    func update() {

        textLabel.text = "Dialog"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
