import SpriteKit

class ViewEndDay: SKNode {
    let title = SKLabelNode(fontNamed: "Chalkduster")

    override init() {
        super.init()

        title.fontSize = 36
        title.fontColor = .white
        title.position.y = Config.screenSize.height/4
        self.addChild(title)
    }

    func update() {
        title.text = "End Day"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
