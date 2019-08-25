class CmdActionUseItem: Command {
    let world: World

    private var itemToUse: Item!
    private var tileInFront: Tile!
    private var buildingInFront: Building!

    init(world: World) {
        self.world = world

        itemToUse = world.player.inventory.items[world.hudInterfaceData.selectedItemInventoryHotbarIndex]
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

        if tileInFront.tileType == .Dirt || tileInFront.tileType == .DirtWatered || tileInFront.tileType == .DirtTilledWatered {
            tileInFront.tileType = .DirtTilled
        }
    }

    private func processSeed() {
        if tileInFront == nil || buildingInFront != nil{
            return
        }

        if tileInFront.tileType == .DirtTilled || tileInFront.tileType == .DirtTilledWatered {
            let newCrop = Building(buildingId: .Garlic, position: tileInFront.position, location: world.currentLocation)

            let gameArea = world.gameAreas.filter({$0.location == world.currentLocation}).first!
            gameArea.buildings.append(newCrop)
            world.addChild(newCrop)

            itemToUse.quantity -= 1
            if itemToUse.quantity <= 0 {
                world.player.inventory.items[world.hudInterfaceData.selectedItemInventoryHotbarIndex] = nil
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
