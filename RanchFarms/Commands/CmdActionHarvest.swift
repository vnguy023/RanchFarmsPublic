class CmdActionHarvest: Command {
    let world: World

    private var crop: Building
    private var player: Person

    init(world: World, crop: Building) {
        self.world = world
        self.crop = crop

        player = world.player
    }

    func execute() {
        switch crop.type {
        case .Crop:
            if let harvestItem = getItemsFromHarvest() {
                if player.inventory.canAcquire(item: harvestItem) {
                    player.inventory.acquire(item: harvestItem)
                    // need to somehow mark building for delete
                }
            }
        default:
            print ("[ActionHarvest] [Desc=Can't Harvest building [buildingType=\(crop.type)]")
        }
    }

    private func getItemsFromHarvest() -> Item? {
        if crop.canHarvest {
            //temporary until we figure out a system for this
            return Item(itemId: .Garlic, quantity: 1)
        } else {
            print( "[ActionHarvest] [Desc=Not ready to Harvest [name=\(crop.buildingInfo.name)] [growth=\(crop.growthProgress)]")
            return nil
        }
    }
}
