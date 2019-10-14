import SpriteKit

class HudControllerGame{
    let screenSize: CGSize

    private let world: World
    private let hudInterfaceData: HudInterfaceDataGame
    private let eventController: EventController

    let camera: SKCameraNode!

    let worldHudNode = SKNode()

    // Hud Overlay
    // -- Game views
    let viewDayInfo: ViewDayInfo
    let viewHotbar: ViewHotbar
    let viewMoneyInfo: ViewMoneyInfo
    let viewGameNotifications: ViewGameNotifications

    // -- Inventory Views
    let viewInventory :ViewInventory

    // -- Dialog Views
    let viewDialog: ViewDialog

    // -- Store Views
    let viewStore: ViewStore

    // Hud Ingame
    let viewSelectedGameTile: ViewSelectedGameTile

    init(camera: SKCameraNode, eventController: EventController, world: World, hudInterfaceData: HudInterfaceDataGame, screenSize: CGSize) {
        self.screenSize = screenSize
        self.eventController = eventController

        self.camera = camera
        camera.zPosition = 10000

        self.world = world
        self.hudInterfaceData = hudInterfaceData

        viewDayInfo = ViewDayInfo(world: world)
        viewDayInfo.position.x = screenSize.width / 2 - viewDayInfo.size.width/2
        viewDayInfo.position.y = screenSize.height / 2 - viewDayInfo.size.height/2
        camera.addChild(viewDayInfo)

        viewHotbar = ViewHotbar(world: world, hudInterfaceData: hudInterfaceData)
        viewHotbar.position.y = screenSize.height / -2 + viewHotbar.size.height/2
        camera.addChild(viewHotbar)

        viewMoneyInfo = ViewMoneyInfo(world: world)
        viewMoneyInfo.position.x = screenSize.width / 2 - viewMoneyInfo.size.width/2
        viewMoneyInfo.position.y = screenSize.height / 2 - viewDayInfo.size.height - viewMoneyInfo.size.height/2
        camera.addChild(viewMoneyInfo)

        viewSelectedGameTile = ViewSelectedGameTile(world: world)
        viewSelectedGameTile.zPosition = 500
        worldHudNode.addChild(viewSelectedGameTile)

        viewInventory = ViewInventory(world: world, hudInterfaceData: hudInterfaceData)
        viewInventory.zPosition = 1000
        camera.addChild(viewInventory)

        viewDialog = ViewDialog(world: world, hudInterfaceData: hudInterfaceData)
        viewDialog.position = CGPoint(x: 0, y: screenSize.height / -2 + viewDialog.size.height/2)
        viewDialog.zPosition = 1000
        camera.addChild(viewDialog)

        viewStore = ViewStore(world: world, hudInterfaceData: hudInterfaceData)
        viewStore.position = CGPoint(x: 0, y: 0)
        viewStore.zPosition = 1000
        camera.addChild(viewStore)

        viewGameNotifications = ViewGameNotifications()
        viewGameNotifications.subscribe(subject: eventController)
        camera.addChild(viewGameNotifications)

        update()
    }

    func update() {
        viewDayInfo.update()
        viewHotbar.update()
        viewMoneyInfo.update()
        viewSelectedGameTile.update()

        // disable things then turn on as needed
        viewGameNotifications.isHidden = true
        viewDialog.isHidden = true
        viewInventory.isHidden = true
        viewStore.isHidden = true

        switch hudInterfaceData.state {
        case .Dialog:
            viewDialog.isHidden = false
            viewDialog.update()
        case .Game:
            viewGameNotifications.isHidden = false
            viewGameNotifications.update()
        case .Inventory:
            viewInventory.isHidden = false
            viewInventory.update()
        case .Store:
            viewStore.isHidden = false
            viewStore.update()
        default:
            print ("[HudControllerGame::Update] [Error=State not handled] [state=\(hudInterfaceData.state)]")
        }
    }
}
