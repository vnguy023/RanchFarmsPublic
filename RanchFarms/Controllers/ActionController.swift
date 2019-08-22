import SpriteKit

class ActionController {
    let world: World!

    init(world: World) {
        self.world = world
    }

    func actionMove(moveVector: CGVector) {
        world.player.position = world.player.position + moveVector.scale(world.player.moveSpeed)
    }

    func actionPrimary() {
        switch world.currentLocation{
        case .Farm:
            world.changeLocation(to: .Town, playerPosition: CGPoint(x: 0*32, y: 0))
        case .Town:
            world.changeLocation(to: .Farm, playerPosition: CGPoint(x: -5*32, y: 0))
        }
    }

    func actionSwitchLeft() {
        world.hudInterfaceData.changeHotBarIndexLeft()
    }

    func actionSwitchRight() {
        world.hudInterfaceData.changeHotBarIndexRight()
    }
}
