import SpriteKit

class HudController{
    let screenSize: CGSize

    let world: World!

    let camera: SKCameraNode!

    let worldHudNode = SKNode()

    // Hud Overlay
    let viewInventoryHotbar: ViewInventoryHotbar
    let viewMoneyInfo: ViewMoneyInfo

    // Hud Ingame
    let viewSelectedGameTile: ViewSelectedGameTile

    init(camera: SKCameraNode, world: World, screenSize: CGSize) {
        self.screenSize = screenSize

        self.camera = camera
        self.world = world

        viewInventoryHotbar = ViewInventoryHotbar(inventory: world.player.inventory, hudInterfaceData: world.hudInterfaceData)
        viewInventoryHotbar.position.y = screenSize.height / -2 + viewInventoryHotbar.size.height/2
        camera.addChild(viewInventoryHotbar)

        viewMoneyInfo = ViewMoneyInfo(player: world.player)
        viewMoneyInfo.position.x = screenSize.width / 2 - viewMoneyInfo.size.width/2
        viewMoneyInfo.position.y = screenSize.height / 2 - viewMoneyInfo.size.height/2
        camera.addChild(viewMoneyInfo)

        viewSelectedGameTile = ViewSelectedGameTile(player: world.player, world: world)
        viewSelectedGameTile.zPosition = 500
        worldHudNode.addChild(viewSelectedGameTile)
    }

    func update() {
        viewInventoryHotbar.update()
        viewMoneyInfo.update()
        viewSelectedGameTile.update()
    }
}
