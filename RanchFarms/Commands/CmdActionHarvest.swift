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
                    world.delete(building: crop)
                }
            }
        default:
            print ("[ActionHarvest] [Desc=Can't Harvest building [buildingType=\(crop.type)]")
        }
    }

    private func getItemsFromHarvest() -> Item? {
        if crop.canHarvest {
            if crop.buildingInfo.harvestItemId == nil {
                print( "[ActionHarvest] [Error] [Desc=No harvestItemId Assigned] [buildingId=\(crop.id)] [growth=\(crop.growthProgress)]")
                return nil
            }
            return Item(itemId: crop.buildingInfo.harvestItemId!, quantity: 1)
        } else {
            print( "[ActionHarvest] [Desc=Not ready to Harvest] [buildingId=\(crop.id)] [growth=\(crop.growthProgress)]")
            return nil
        }
    }
}
