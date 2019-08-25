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
        let cmdActionUseItem  = CmdActionUseItem(world: world)
        cmdActionUseItem.execute()
    }

    func actionSwitchLeft() {
        world.hudInterfaceData.changeHotBarIndexLeft()
    }

    func actionSwitchRight() {
        world.hudInterfaceData.changeHotBarIndexRight()
    }
}
