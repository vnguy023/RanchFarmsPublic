import SpriteKit

class ViewSplash: SKNode {
    let title = SKLabelNode(fontNamed: "Chalkduster")

    override init() {
        super.init()

        title.fontSize = 36
        title.fontColor = .white
        title.position.y = Config.screenSize.height/4
        title.text = "Ranch Farms"
        self.addChild(title)
    }

    func update() {}

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
