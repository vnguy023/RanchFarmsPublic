class CmdActionUseItem: Command {
    let world: World

    private var itemToUse: Item!
    private var tileInFront: Tile!
    private var buildingInFront: Building!

    init(world: World) {
        self.world = world

        itemToUse = world.player.inventory.items[world.hudInterfaceData.highlightedItemInventoryHotbarIndex]
        tileInFront = world.getTileAt(position: world.player.getPositionInFront(), location: world.currentLocation)
        buildingInFront = world.getBuildingAt(position: world.player.getPositionInFront(), location: world.currentLocation)
    }

    func execute() {
        if itemToUse != nil {
            switch itemToUse.itemInfo.itemType {
            case .Axe: break
            case .Hoe:
                processHoe()
            case .Seed:
                processSeed()
            case .WaterCan:
                processWaterCan()
            case .Unknown: break
            default:
                print ("[ActionUse] [Desc=itemType notHandled] [itemType=\(itemToUse.itemInfo.itemType)]")
            }
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

    private func processSeed() {
        if tileInFront == nil || buildingInFront != nil{
            return
        }

        if tileInFront.type == .DirtTilled || tileInFront.type == .DirtTilledWatered {
            let newCrop = Building(buildingId: .Garlic, mapPoint: tileInFront.mapPoint)

            let gameArea = world.gameAreas.filter({$0.location == world.currentLocation}).first!
            gameArea.buildings.append(newCrop)
            world.addChild(newCrop)

            itemToUse.quantity -= 1
            if itemToUse.quantity <= 0 {
                world.player.inventory.items[world.hudInterfaceData.highlightedItemInventoryHotbarIndex] = nil
            }
        }
    }

    private func processWaterCan() {
        if tileInFront == nil {
            return
        }

        tileInFront.water()
    }
}
