class CmdEndDay: Command {
    let world: World

    init(world: World) {
        self.world = world
    }

    func execute() {
        for gameArea in world.gameAreas {
            var terrainsToDelete = [Terrain]()
            for building in gameArea.value.buildings {
                if building.buildingInfo.buildingType == .Crop {
                    if let terrain = world.getTerrainAt(position: building.position, location: building.location), terrain.isWatered {
                        building.growthProgress += 1
                    }
                }
            }

            for terrain in gameArea.value.terrains {
                let buildings = world.getBuildingsAt(position: terrain.position, location: terrain.location)

                switch terrain.type {
                case .Tilled: fallthrough
                case .Watered:
                    if !buildings.isEmpty || Int.random(in: 0...1) % 2 == 0{
                        terrainsToDelete.append(terrain)
                    } else {
                        terrain.type = .Tilled
                    }
                default: break
                }
            }
            terrainsToDelete.forEach({world.delete(terrain: $0)})
        }

        sellItems()

        world.daysElapsed += 1
    }

    private func sellItems() {
        world.player.money += world.farmDeliveryBox.getTotalMoneyIfSold()
        world.farmDeliveryBox.removeAll()
    }
}
