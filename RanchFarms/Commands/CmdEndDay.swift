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
                let building = world.getBuildingAt(position: tile.position, location: tile.location)

                switch tile.type {
                case .DirtTilled:
                    if building != nil || Int.random(in: 0...1) % 2 == 0  {
                        tile.type = .Dirt
                    }
                case .DirtWatered:
                    tile.type = .Dirt
                case .DirtTilledWatered:
                    if building != nil || Int.random(in: 0...1) % 2 == 0  {
                        tile.type = .Dirt
                    }
                    else {
                        tile.type = .DirtTilled
                    }
                default: break
                }
            }
        }
    }
}
