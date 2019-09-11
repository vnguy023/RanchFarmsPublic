import SpriteKit

class ViewDayInfo: SKSpriteNode {
    let world: World

    let currentDayLabel = SKLabelNode(fontNamed: "Chalkduster")
    let currentTimeLabel = SKLabelNode(fontNamed: "Chalkduster")

    init(world: World) {
        self.world = world

        super.init(texture: nil, color: .white, size: Config.dayInfoSize)

        currentDayLabel.position = CGPoint(x: self.size.width / 2 - 10, y: self.size.height / 4)
        currentDayLabel.fontSize = 24
        currentDayLabel.fontColor = .black
        currentDayLabel.horizontalAlignmentMode = .right
        currentDayLabel.verticalAlignmentMode = .center
        currentDayLabel.zPosition = 100
        self.addChild(currentDayLabel)

        currentTimeLabel.position = CGPoint(x: size.width / 2 - 10, y: self.size.height / -4)
        currentTimeLabel.fontSize = 24
        currentTimeLabel.fontColor = .black
        currentTimeLabel.horizontalAlignmentMode = .right
        currentTimeLabel.verticalAlignmentMode = .center
        currentTimeLabel.zPosition = 100
        self.addChild(currentTimeLabel)

        update()
    }

    func update() {
        currentDayLabel.text = "Day \(world.currentDay)"

        var hoursText = "\(world.getCurrentHour())"
        if world.getCurrentHour() == 0 { hoursText = "12" }

        var minutesText = "\((world.getCurrentMinutes()/10)*10)"
        if world.getCurrentMinutes() < 10 { minutesText = "00" }

        currentTimeLabel.text = "\(hoursText):\(minutesText)\(world.getCurrentMeridian())"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
