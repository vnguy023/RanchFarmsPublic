class CmdActionUseItem: Command {
    let world: World
    let hudInterfaceData: HudInterfaceDataGame

    private var itemToUse: Item!
    private var terrainInFront: Terrain!
    private var tileInFront: Tile!
    private var buildingsInFront: [Building]

    init(world: World, hudInterfaceData: HudInterfaceDataGame) {
        self.world = world
        self.hudInterfaceData = hudInterfaceData

        if let itemIndex = hudInterfaceData.getHotBarItemIndex() {
            itemToUse = world.player.inventory.items[itemIndex]
        }
        terrainInFront = world.getTerrainAt(position: world.player.getPositionInFront(), location: world.currentLocation)
        tileInFront = world.getTileAt(position: world.player.getPositionInFront(), location: world.currentLocation)
        buildingsInFront = world.getBuildingsAt(position: world.player.getPositionInFront(), location: world.currentLocation)
    }

    func execute() {
        if itemToUse != nil {
            switch itemToUse.info.itemType {
            case .Axe: break
            case .Hoe:
                processHoe()
            case .PickAxe:
                processPickAxe()
            case .Seed:
                processSeed()
            case .WaterCan:
                processWaterCan()
            case .Crop:
                processCrop()
            case .Fish:
                processFish()
            case .Weapon:
                processWeapon()
            case .Unknown: break
            default:
                print ("[ActionUse] [Desc=itemType notHandled] [itemType=\(itemToUse.info.itemType)]")
            }
        }
    }

    private func processCrop() {
        if !buildingsInFront.filter({$0.type == .DeliveryBox}).isEmpty {
            sellItem()
        }
    }

    private func processFish() {
        if !buildingsInFront.filter({$0.type == .DeliveryBox}).isEmpty {
            sellItem()
        }
    }

    private func processHoe() {
        if !world.player.canUseTool() {
            return
        }

        world.player.setNewState(state: .Hoeing)
        
        if tileInFront == nil {
            return
        }

        for crop in buildingsInFront.filter({$0.type == .Crop}) {
            crop.sfxApplied = .Shake
            return
        }

        if !buildingsInFront.isEmpty {
            return
        }

        if tileInFront.type == .Dirt {
            if terrainInFront == nil {
                world.add(terrain: Terrain(player: .PlayerOne, terrainType: .Tilled, mapPoint: tileInFront.mapPoint))
            } else if terrainInFront.isWatered {
                terrainInFront.type = .Tilled
            }
        }
    }

    private func processPickAxe() {
        if !world.player.canUseTool() {
            return
        }

        world.player.setNewState(state: .Mining)

        if tileInFront == nil {
            return
        }

        if buildingsInFront.isEmpty {
            if terrainInFront != nil {
                world.delete(terrain: terrainInFront)
            }
        } else {
            for crop in buildingsInFront.filter({$0.type == .Crop}) {
                world.delete(building: crop)
            }
        }
    }

    private func processSeed() {
        if !buildingsInFront.filter({$0.type == .DeliveryBox}).isEmpty  {
            sellItem()
            return
        } else if tileInFront == nil {
            return
        } else if terrainInFront == nil {
            return
        }

        if terrainInFront.isTilled {
            if itemToUse.info.buildingId == nil {
                print ("[CmdActionUseItem] [Error=trying to plant a seed w/o buildingId assigned] [itemId=\(itemToUse.id)]")
                return
            }

            world.add(building: Building(player: .PlayerOne, buildingId: itemToUse.info.buildingId!, mapPoint: tileInFront.mapPoint))

            itemToUse.quantity -= 1
            if itemToUse.quantity <= 0 {
                if let itemIndex = hudInterfaceData.getHotBarItemIndex() {
                    world.player.inventory.items[itemIndex] = nil
                }
            }
        }
    }

    private func processWaterCan() {
        if !world.player.canUseTool() {
            return
        }

        world.player.setNewState(state: .Watering)

        if tileInFront == nil {
            return
        } else if !buildingsInFront.filter({$0.type != .Crop}).isEmpty {
            return
        }

        if tileInFront.type == .Dirt {
            if terrainInFront != nil && terrainInFront.type == .Tilled {
                terrainInFront.type = .Watered
            }
        }
    }

    private func processWeapon() {
        if !world.player.canUseTool() {
            return
        }

        world.player.setNewState(state: .Attacking)

    }

    private func sellItem() {
        if itemToUse.info.canSell {
            if !buildingsInFront.filter({$0.id == .FarmDeliveryBox}).isEmpty {
                world.farmDeliveryBox.addItem(itemToUse)
                world.player.inventory.deleteItem(item: itemToUse)
            }
        }
    }
}
