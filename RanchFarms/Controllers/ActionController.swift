import SpriteKit

class ActionController {
    let world: World!

    init(world: World) {
        self.world = world
    }

    func actionMove(moveVector: CGVector) {
        if !moveVector.isZeroVector {
            let initPosition = world.player.position
            world.player.position = world.player.position + moveVector.scale(world.player.moveSpeed)
            world.player.faceDirection = CGVector.getDirection4(start: initPosition, end: world.player.position)
        }
    }

    func actionPrimary() {
        let currentGameArea = world.gameAreas.filter({$0.location == world.currentLocation})[0]

        let buildings = currentGameArea.buildings.filter({$0.contains(world.player.getPositionInFront())})

        if let teleport = buildings.filter({$0.buildingInfo.buildingType == .Teleport}).first {
            world.teleport(to: teleport.teleport!)
        } else if let _ = buildings.filter({$0.buildingInfo.buildingType == .Bed}).first {
            let cmdEndDay  = CmdEndDay(world: world)
            cmdEndDay.execute()
        }
    }

    func actionUse() {
        if let itemToUse = world.player.inventory.items[world.hudInterfaceData.selectedItemInventoryHotbarIndex] {
            switch itemToUse.itemInfo.itemType {
            case .Axe: break
            case .Hoe:
                if let tileInFront = world.getTileAt(position: world.player.getPositionInFront(), location: world.currentLocation) {
                    if tileInFront.tileType == .Dirt {
                        tileInFront.tileType = .TilledDirt
                    }
                }
            case .Seed:
                if let tileInFront = world.getTileAt(position: world.player.getPositionInFront(), location: world.currentLocation) {
                    if tileInFront.tileType == .TilledDirt
                        && world.getBuildingAt(position: world.player.getPositionInFront(), location: world.currentLocation) == nil {
                        // Somehow need to create a buildingat that tile position
                        let newCrop = Building(buildingId: .Garlic, position: tileInFront.position, location: world.currentLocation)

                        let gameArea = world.gameAreas.filter({$0.location == world.currentLocation}).first!
                        gameArea.buildings.append(newCrop)
                        world.addChild(newCrop)

                        // TODO: update player Inventory
                    }
                }
                
            case .Unknown: break
            default:
                print ("[ActionUse] [Desc=itemType notHandled] [itemType=\(itemToUse.itemInfo.itemType)]")
            }
        }
    }



    func actionSwitchLeft() {
        world.hudInterfaceData.changeHotBarIndexLeft()
    }

    func actionSwitchRight() {
        world.hudInterfaceData.changeHotBarIndexRight()
    }
}
