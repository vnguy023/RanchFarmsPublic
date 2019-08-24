import SpriteKit

class ViewMoneyInfo: SKSpriteNode {
    let player: Person

    private var amountLabel: SKLabelNode!

    init(player: Person) {
        self.player = player

        super.init(texture: nil, color: .red, size: Config.viewMoneySize)

        self.texture = TextureManager.shared.getTexture(hudImageName: "hudItemBorder")

        amountLabel = SKLabelNode(fontNamed: "Chalkduster")
        amountLabel.zPosition = 150
        amountLabel.position = CGPoint(x: self.size.width/2 - 4, y: 0)
        amountLabel.horizontalAlignmentMode = .right
        amountLabel.verticalAlignmentMode = .center
        amountLabel.fontSize = Config.viewMoneySize.height - 8
        amountLabel.fontColor = .black
        self.addChild(amountLabel)

        update()
    }

    func update() {
        amountLabel.text = "\(player.money)"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
