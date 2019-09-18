import SpriteKit

class RenderController {
    let world: World!

    init(world: World) {
        self.world = world
    }

    func update() {
        renderPlayer()
        updateZOffsets()
    }

    private func renderPlayer() {
        if let animation = AnimationManager.shared.getAnimation(person: world.player) {
            var stateAnimationDuration = GameTick(1)
            switch world.player.state {
            case .Idle: break
            case .Walking:
                stateAnimationDuration = Config.animationWalkGameTickDuration
            }

            let progressPercentage = CGFloat(world.player.stateDurationElapsed)/CGFloat(stateAnimationDuration)
            world.player.applyAnimationFrame(animation.getFrame(animationProgress: progressPercentage))
        }
    }

    private func updateZOffsets() {
        if let currentArea = world.gameAreas[world.currentLocation] {
            var gameObjects = [GameObject]()
            gameObjects.append(world.player)

            currentArea.tiles.forEach({gameObjects.append($0)})
            currentArea.terrains.forEach({gameObjects.append($0)})
            currentArea.buildings.forEach({gameObjects.append($0)})

            for object in gameObjects {
                object.zPosition = object.position.y * -1 + object.zOffset
            }
        }
    }
}
