import SpriteKit

class HudControllerEndDay {
    let screenSize: CGSize

    let node = SKNode()
    
    let hudInterfaceData: HudInterfaceDataEndDay

    // Hud Overlay
    let title = SKLabelNode(fontNamed: "Chalkduster")

    init(hudInterfaceDataEndDay: HudInterfaceDataEndDay, screenSize: CGSize) {
        self.hudInterfaceData = hudInterfaceDataEndDay
        self.screenSize = screenSize

        title.fontColor = .white
        title.fontSize = 32
        title.position = CGPoint(x: 0, y: screenSize.height/4)

        self.node.addChild(title)

        update()
    }

    func update() {
        if hudInterfaceData.reloadHud {

        }

        hudInterfaceData.reloadHud = false

        title.text = "End Day: Press Primary Action to continue"
    }
}
