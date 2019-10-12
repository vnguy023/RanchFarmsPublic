import SpriteKit

class ViewDayInfo: SKSpriteNode {
    let world: World

    let currentSeasonLabel = SKLabelNode(fontNamed: "Chalkduster")
    let currentDayLabel = SKLabelNode(fontNamed: "Chalkduster")
    let currentWeekDayLabel = SKLabelNode(fontNamed: "Chalkduster")
    let currentTimeLabel = SKLabelNode(fontNamed: "Chalkduster")

    init(world: World) {
        self.world = world

        super.init(texture: nil, color: .white, size: Config.dayInfoSize)

        currentSeasonLabel.position = CGPoint(x: self.size.width / 2 - 10, y: self.size.height / 3)
        currentSeasonLabel.fontSize = 24
        currentSeasonLabel.fontColor = .black
        currentSeasonLabel.horizontalAlignmentMode = .right
        currentSeasonLabel.verticalAlignmentMode = .center
        currentSeasonLabel.zPosition = 100
        self.addChild(currentSeasonLabel)

        currentWeekDayLabel.position = CGPoint(x: self.size.width / -2 + 10, y: 0)
        currentWeekDayLabel.fontSize = 24
        currentWeekDayLabel.fontColor = .black
        currentWeekDayLabel.horizontalAlignmentMode = .left
        currentWeekDayLabel.verticalAlignmentMode = .center
        currentWeekDayLabel.zPosition = 100
        self.addChild(currentWeekDayLabel)

        currentDayLabel.position = CGPoint(x: self.size.width / 2 - 10, y: 0)
        currentDayLabel.fontSize = 24
        currentDayLabel.fontColor = .black
        currentDayLabel.horizontalAlignmentMode = .right
        currentDayLabel.verticalAlignmentMode = .center
        currentDayLabel.zPosition = 100
        self.addChild(currentDayLabel)

        currentTimeLabel.position = CGPoint(x: size.width / 2 - 10, y: self.size.height / -3)
        currentTimeLabel.fontSize = 24
        currentTimeLabel.fontColor = .black
        currentTimeLabel.horizontalAlignmentMode = .right
        currentTimeLabel.verticalAlignmentMode = .center
        currentTimeLabel.zPosition = 100
        self.addChild(currentTimeLabel)

        update()
    }

    func update() {
        currentSeasonLabel.text = "\(world.getCurrentSeason().toString())"
        currentDayLabel.text = "\(world.getCurrentDay())"

        currentWeekDayLabel.text = world.getCurrentWeekDay().getString()

        var hoursText = "\(world.getCurrentHour()%12)"
        if world.getCurrentHour()%12 == 0  { hoursText = "12" }

        var minutesText = "\((world.getCurrentMinutes()/10)*10)"
        if world.getCurrentMinutes() < 10 { minutesText = "00" }

        currentTimeLabel.text = "\(hoursText):\(minutesText)\(world.getCurrentMeridian())"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
