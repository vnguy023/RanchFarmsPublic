import SpriteKit

class HudControllerEndDay {
    let screenSize: CGSize

    let node = SKNode()

    let world: World
    let hudInterfaceData: HudInterfaceDataEndDay

    // Hud Overlay
    let title = SKLabelNode(fontNamed: "Chalkduster")

    let viewSoldItems: ViewSoldItems!

    init(world: World, hudInterfaceDataEndDay: HudInterfaceDataEndDay, screenSize: CGSize) {
        self.world = world
        self.hudInterfaceData = hudInterfaceDataEndDay
        self.screenSize = screenSize

        title.fontColor = .white
        title.fontSize = 32
        title.verticalAlignmentMode = .bottom
        title.position = CGPoint(x: 0, y: screenSize.height / -2 + 16)

        self.node.addChild(title)

        self.viewSoldItems = ViewSoldItems(world: world, hudInterfaceData: hudInterfaceData)
        self.node.addChild(viewSoldItems)

        hudInterfaceData.reloadHud = true
        update()
    }

    func update() {
        if hudInterfaceData.reloadHud {
            title.text = "End Day: Press Primary Action to continue"

            viewSoldItems.update()
        }

        hudInterfaceData.reloadHud = false
    }
}
