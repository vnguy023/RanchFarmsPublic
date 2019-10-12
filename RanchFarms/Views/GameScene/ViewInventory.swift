import SpriteKit

class ViewInventory: SKSpriteNode {
    private let world: World
    private let hudInterfaceData: HudInterfaceDataGame

    private var itemButtons = [ViewItemButton]()
    private var trashCan = ViewSaveDelete() // reusing this for now

    private var inventory: Inventory {
        get {return world.player.inventory}
    }

    private let blackScreen = SKSpriteNode(color: .black, size: Config.screenSize)

    init(world: World, hudInterfaceData: HudInterfaceDataGame) {
        self.world = world
        self.hudInterfaceData = hudInterfaceData

        let inventorySize = CGSize(width: Config.itemImageSize.width * Config.viewInventoryColumns,
                                   height: Config.itemImageSize.height)
        super.init(texture: nil, color: .red, size: inventorySize)

        blackScreen.alpha = 0.5
        blackScreen.zPosition = -10
        self.addChild(blackScreen)

        trashCan.position.x = self.size.width/2 + trashCan.size.width/2
        trashCan.position.y = self.size.height / -2
        trashCan.zPosition = 500
        self.addChild(trashCan)

        update()
    }

    func update() {
        itemButtons.forEach({$0.removeFromParent()})
        itemButtons.removeAll()

        if hudInterfaceData.isInventoryTrashCanHighlighted() {
            trashCan.state = .Highlight
        } else {
            trashCan.state = .None
        }

        var index = 0
        for y in 0 ..< Int(Config.viewInventoryRows) {
            for x in 0 ..< Int(Config.viewInventoryColumns) {
                let itemButton = ViewItemButton(item: inventory.items[index])
                itemButton.zPosition = 100
                itemButton.position.x = self.size.width / -2 + (CGFloat(x) * Config.itemImageSize.width) + Config.itemImageSize.width/2
                itemButton.position.y = self.size.height / 2 - (CGFloat(y) * Config.itemImageSize.height) - Config.itemImageSize.height/2
                self.addChild(itemButton)

                if let selectedItemIndex = hudInterfaceData.getInventorySelectedItemIndex()
                    , index == selectedItemIndex {
                    itemButton.state = .Select
                }

                if let highlightedItemIndex = hudInterfaceData.getInventoryHighlightedItemIndex()
                    , index == highlightedItemIndex {
                    itemButton.state = .Highlight
                }

                index += 1

                itemButtons.append(itemButton)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
