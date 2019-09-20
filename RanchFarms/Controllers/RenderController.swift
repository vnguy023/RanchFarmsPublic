import SpriteKit

class RenderController {
    let world: World!

    init(world: World) {
        self.world = world
    }

    func update() {
        renderPlayer()
        updateSFXs()
        updateZOffsets()
    }

    private func renderPlayer() {
        if let animation = AnimationManager.shared.getAnimation(person: world.player) {
            var stateAnimationDuration = GameTick(1)
            switch world.player.state {
            case .Idle: break
            case .Walking:
                stateAnimationDuration = Config.animationWalkGameTickDuration

            // Tool related states
            case .Axeing: fallthrough
            case .Hoeing: fallthrough
            case .Mining: fallthrough
            case .Watering:
                stateAnimationDuration = Config.animationHoeingGameTickDuration
            }

            let progressPercentage = CGFloat(world.player.stateDurationElapsed)/CGFloat(stateAnimationDuration)
            world.player.applyAnimationFrame(animation.getFrame(animationProgress: progressPercentage))
        }
    }

    private func updateSFXs() {
        var gameObjects = [GameObject]()
        gameObjects.append(world.player)
        if let gameArea = world.gameAreas[world.currentLocation] {
            gameArea.buildings.forEach({gameObjects.append($0)})
            // not sure if we need these yet
            //gameArea.terrains.forEach({gameObjects.append($0)})
            //gameArea.tiles.forEach({gameObjects.append($0)})
        }

        for object in gameObjects.filter({$0.sfxApplied != nil}) {
            if let sfx = SFXManager.shared.getSFX(sfxId: object.sfxApplied!) {
                // TODO: figure out a structure for this
                let duration = Config.GameTicksPerSecond
                
                let progressPercentage = CGFloat(object.sfxDurationElapsed)/CGFloat(duration)
                object.applySFXFrame(sfx.getFrame(progress: progressPercentage))

                if progressPercentage > 1 {
                    object.sfxApplied = nil
                }

            } else {
                print ("[RenderController] [updateSFX] [Error=Unable to get sfx] [SFXId=\(object.sfxApplied!)]")
            }
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
