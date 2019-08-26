import SpriteKit

class ViewDayInfo: SKSpriteNode {
    let world: World

    let currentDayLabel = SKLabelNode(fontNamed: "Chalkduster")

    init(world: World) {
        self.world = world

        super.init(texture: nil, color: .white, size: Config.dayInfoSize)

        currentDayLabel.position = CGPoint(x: size.width / -2, y: 0)
        currentDayLabel.fontSize = 24
        currentDayLabel.fontColor = .black
        currentDayLabel.horizontalAlignmentMode = .left
        currentDayLabel.verticalAlignmentMode = .center
        currentDayLabel.zPosition = 100
        self.addChild(currentDayLabel)

        update()
    }

    func update() {
        currentDayLabel.text = "Day \(world.currentDay)"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
