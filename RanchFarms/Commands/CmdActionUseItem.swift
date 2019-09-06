class CmdActionUseItem: Command {
    let world: World

    private var itemToUse: Item!
    private var tileInFront: Tile!
    private var buildingInFront: Building!

    init(world: World) {
        self.world = world

        if let itemIndex = world.hudInterfaceData.getHotBarItemIndex() {
            itemToUse = world.player.inventory.items[itemIndex]
        }
        tileInFront = world.getTileAt(position: world.player.getPositionInFront(), location: world.currentLocation)
        buildingInFront = world.getBuildingAt(position: world.player.getPositionInFront(), location: world.currentLocation)
    }

    func execute() {
        if itemToUse != nil {
            switch itemToUse.itemInfo.itemType {
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
            case .Unknown: break
            default:
                print ("[ActionUse] [Desc=itemType notHandled] [itemType=\(itemToUse.itemInfo.itemType)]")
            }
        }
    }

    private func processCrop() {
        if buildingInFront != nil {
            if buildingInFront.type == .DeliveryBox {
                sellItem()
            }

            return
        }
    }

    private func processHoe() {
        if tileInFront == nil {
            return
        }

        if buildingInFront != nil {
            return
        }

        if tileInFront.type == .Dirt || tileInFront.type == .DirtWatered || tileInFront.type == .DirtTilledWatered {
            tileInFront.type = .DirtTilled
        }
    }

    private func processPickAxe() {
        if tileInFront == nil {
            return
        }

        if buildingInFront == nil {
            if tileInFront.type == .DirtTilled || tileInFront.type == .DirtWatered || tileInFront.type == .DirtTilledWatered {
                tileInFront.type = .Dirt
            }
        } else {
            if buildingInFront.type == .Crop {
                world.delete(building: buildingInFront)
            }
        }
    }

    private func processSeed() {
        if buildingInFront != nil {
            if buildingInFront.type == .DeliveryBox {
                sellItem()
            }

            return
        } else if tileInFront == nil {
            return
        }

        if tileInFront.type == .DirtTilled || tileInFront.type == .DirtTilledWatered {
            let newCrop = Building(buildingId: .Garlic, mapPoint: tileInFront.mapPoint)

            let gameArea = world.gameAreas.filter({$0.location == world.currentLocation}).first!
            gameArea.buildings.append(newCrop)
            world.addChild(newCrop)

            itemToUse.quantity -= 1
            if itemToUse.quantity <= 0 {
                if let itemIndex = world.hudInterfaceData.getHotBarItemIndex() {
                    world.player.inventory.items[itemIndex] = nil
                }
            }
        }
    }

    private func processWaterCan() {
        if tileInFront == nil {
            return
        }

        tileInFront.water()
    }

    private func sellItem() {
        if itemToUse.itemInfo.canSell {
            if buildingInFront.buildingId == .FarmDeliveryBox {
                world.farmDeliveryBoxItems.append(itemToUse)
                world.player.inventory.deleteItem(item: itemToUse)
            }
        }
    }
}
