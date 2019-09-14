class CmdEndDay: Command {
    let world: World

    init(world: World) {
        self.world = world
    }

    func execute() {
        for gameArea in world.gameAreas {
            for building in gameArea.buildings {
                let terrain = world.getTerrainAt(position: building.position, location: building.location)
                if building.buildingInfo.buildingType == .Crop
                    && terrain != nil && terrain!.isWatered {
                    building.growthProgress += 1
                }
            }

            var terrainsToDelete = [Terrain]()
            for terrain in gameArea.terrains {
                let buildings = world.getBuildingsAt(position: terrain.position, location: terrain.location)

                switch terrain.type {
                case .Tilled:
                    if !buildings.isEmpty || Int.random(in: 0...1) % 2 == 0  {
                        terrainsToDelete.append(terrain)
                    }
                case .Watered:
                    terrainsToDelete.append(terrain)
                case .TilledWatered:
                    if !buildings.isEmpty || Int.random(in: 0...1) % 2 == 0  {
                        terrainsToDelete.append(terrain)
                    }
                    else {
                        terrain.type = .Tilled
                    }
                default: break
                }
            }
            terrainsToDelete.forEach({world.delete(terrain: $0)})
        }

        sellItems()

        world.daysElapsed += 1

        saveGame()
    }

    private func sellItems() {
        for item in world.farmDeliveryBoxItems {
            world.player.money += item.quantity * item.itemInfo.sellPrice
        }
        world.farmDeliveryBoxItems.removeAll()
    }

    private func saveGame() {
        let cmdSaveGame = CmdSaveGame(world: world)
        cmdSaveGame.execute()
    }
}
