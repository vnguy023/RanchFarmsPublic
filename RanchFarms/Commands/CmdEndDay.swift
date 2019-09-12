class CmdEndDay: Command {
    let world: World

    init(world: World) {
        self.world = world
    }

    func execute() {
        for gameArea in world.gameAreas {
            for building in gameArea.buildings {
                let tile = world.getTileAt(position: building.position, location: building.location)
                if building.buildingInfo.buildingType == .Crop
                    && tile != nil && tile!.isWatered {
                    building.growthProgress += 1
                }
            }

            for tile in gameArea.tiles {
                let buildings = world.getBuildingsAt(position: tile.position, location: tile.location)

                switch tile.type {
                case .DirtTilled:
                    if !buildings.isEmpty || Int.random(in: 0...1) % 2 == 0  {
                        tile.type = .Dirt
                    }
                case .DirtWatered:
                    tile.type = .Dirt
                case .DirtTilledWatered:
                    if !buildings.isEmpty || Int.random(in: 0...1) % 2 == 0  {
                        tile.type = .Dirt
                    }
                    else {
                        tile.type = .DirtTilled
                    }
                default: break
                }
            }
        }

        sellItems()

        world.daysElapsed += 1
    }

    private func sellItems() {
        for item in world.farmDeliveryBoxItems {
            world.player.money += item.quantity * item.itemInfo.sellPrice
        }
        world.farmDeliveryBoxItems.removeAll()
    }
}
