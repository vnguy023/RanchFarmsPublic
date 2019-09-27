import SpriteKit

class HudControllerGame{
    let screenSize: CGSize

    let world: World!

    let camera: SKCameraNode!

    let worldHudNode = SKNode()

    // Hud Overlay
    // -- Game views
    let viewDayInfo: ViewDayInfo
    let viewHotbar: ViewHotbar
    let viewMoneyInfo: ViewMoneyInfo

    // -- Inventory Views
    let viewInventory :ViewInventory

    // -- Dialog Views
    let viewDialog: ViewDialog

    // -- Store Views
    let viewStore: ViewStore

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

        viewHotbar = ViewHotbar(world: world)
        viewHotbar.position.y = screenSize.height / -2 + viewHotbar.size.height/2
        camera.addChild(viewHotbar)

        viewMoneyInfo = ViewMoneyInfo(world: world)
        viewMoneyInfo.position.x = screenSize.width / 2 - viewMoneyInfo.size.width/2
        viewMoneyInfo.position.y = screenSize.height / 2 - viewDayInfo.size.height - viewMoneyInfo.size.height/2
        camera.addChild(viewMoneyInfo)

        viewSelectedGameTile = ViewSelectedGameTile(world: world)
        viewSelectedGameTile.zPosition = 500
        worldHudNode.addChild(viewSelectedGameTile)

        viewInventory = ViewInventory(world: world)
        viewInventory.zPosition = 1000
        camera.addChild(viewInventory)

        viewDialog = ViewDialog(world: world)
        viewDialog.position = CGPoint(x: 0, y: screenSize.height / -2 + viewDialog.size.height/2)
        viewDialog.zPosition = 1000
        camera.addChild(viewDialog)

        viewStore = ViewStore(world: world)
        viewStore.position = CGPoint(x: 0, y: 0)
        viewStore.zPosition = 1000
        camera.addChild(viewStore)

        update()
    }

    func update() {
        viewDayInfo.update()
        viewHotbar.update()
        viewMoneyInfo.update()
        viewSelectedGameTile.update()

        if world.hudInterfaceData.state == .Dialog {
            viewDialog.isHidden = false
            viewDialog.update()
        } else {
            viewDialog.isHidden = true
        }

        if world.hudInterfaceData.state == .Inventory {
            viewInventory.isHidden = false
            viewInventory.update()
        } else {
            viewInventory.isHidden = true
        }

        if world.hudInterfaceData.state == .Store {
            viewStore.isHidden = false
            viewStore.update()
        } else {
            viewStore.isHidden = true
        }
    }
}
