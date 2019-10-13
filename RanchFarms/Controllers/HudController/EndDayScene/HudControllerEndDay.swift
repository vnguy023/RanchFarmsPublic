import SpriteKit

class HudControllerEndDay {
    let screenSize: CGSize

    let node = SKNode()
    
    let hudInterfaceData: HudInterfaceDataEndDay

    // Hud Overlay
    let title = SKLabelNode(fontNamed: "Chalkduster")

    let viewSoldItems: ViewSoldItems!

    init(hudInterfaceDataEndDay: HudInterfaceDataEndDay, screenSize: CGSize) {
        self.hudInterfaceData = hudInterfaceDataEndDay
        self.screenSize = screenSize

        title.fontColor = .white
        title.fontSize = 32
        title.position = CGPoint(x: 0, y: screenSize.height/4)

        self.node.addChild(title)

        self.viewSoldItems = ViewSoldItems()
        self.node.addChild(viewSoldItems)

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
