import SpriteKit

class HudController{
    let screenSize: CGSize

    let world: World!

    let camera: SKCameraNode!

    let worldHudNode = SKNode()

    // Hud Overlay
    // -- Game views
    let viewDayInfo: ViewDayInfo
    let viewInventoryHotbar: ViewInventoryHotbar
    let viewMoneyInfo: ViewMoneyInfo

    // -- Inventory Views
    let viewInventory :ViewInventory

    // Hud Ingame
    let viewSelectedGameTile: ViewSelectedGameTile

    init(camera: SKCameraNode, world: World, screenSize: CGSize) {
        self.screenSize = screenSize

        self.camera = camera
        camera.zPosition = 10000

        self.world = world

        viewDayInfo = ViewDayInfo(world: world)
        viewDayInfo.position.x = screenSize.width / 2 - viewDayInfo.size.width/2
        viewDayInfo.position.y = screenSize.height / 2 - viewDayInfo.size.height/2
        camera.addChild(viewDayInfo)

        viewInventoryHotbar = ViewInventoryHotbar(inventory: world.player.inventory, hudInterfaceData: world.hudInterfaceData)
        viewInventoryHotbar.position.y = screenSize.height / -2 + viewInventoryHotbar.size.height/2
        camera.addChild(viewInventoryHotbar)

        viewMoneyInfo = ViewMoneyInfo(player: world.player)
        viewMoneyInfo.position.x = screenSize.width / 2 - viewMoneyInfo.size.width/2
        viewMoneyInfo.position.y = screenSize.height / 2 - viewDayInfo.size.height - viewMoneyInfo.size.height/2
        camera.addChild(viewMoneyInfo)

        viewSelectedGameTile = ViewSelectedGameTile(player: world.player, world: world)
        viewSelectedGameTile.zPosition = 500
        worldHudNode.addChild(viewSelectedGameTile)

        viewInventory = ViewInventory(inventory: world.player.inventory, hudInterfaceData: world.hudInterfaceData)
        viewInventory.zPosition = 1000
        camera.addChild(viewInventory)
    }

    func update() {
        viewDayInfo.update()
        viewInventoryHotbar.update()
        viewMoneyInfo.update()
        viewSelectedGameTile.update()

        if world.hudInterfaceData.gameState == .Inventory {
            viewInventory.update()
            viewInventory.isHidden = false
        } else {
            viewInventory.isHidden = true
        }

    }
}
