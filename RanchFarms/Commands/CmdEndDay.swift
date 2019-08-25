class CmdEndDay: Command {
    let world: World


    init(world: World) {
        self.world = world
    }

    func execute() {
        for gameArea in world.gameAreas {
            for building in gameArea.buildings {
                if building.buildingInfo.buildingType == .Crop {
                    building.growthProgress += 1
                }
            }

            for tile in gameArea.tiles {
                if tile.tileType == .TilledDirt {
                    tile.tileType = .Dirt
                }
            }
        }
    }
}
