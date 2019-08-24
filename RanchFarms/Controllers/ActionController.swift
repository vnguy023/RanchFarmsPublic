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

        let doors = currentGameArea.buildings.filter({$0.contains(world.player.getPositionInFront())}).filter({$0.type == .Door})

        if let door = doors.first {
            world.teleport(to: door.teleport!)
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
