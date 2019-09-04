import SpriteKit

class ViewStore: SKSpriteNode {
    let world: World

    let textLabel = SKLabelNode(fontNamed: "ChalkDuster")

    init(world: World) {
        self.world = world

        super.init(texture: nil, color: .purple, size: Config.viewStoreSize)

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
        textLabel.text = "Store"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
