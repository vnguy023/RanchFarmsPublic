import SpriteKit

class RenderController {
    let world: World!

    init(world: World) {
        self.world = world
    }

    func update() {
        renderPlayer()
    }

    private func renderPlayer() {
        if let animation = AnimationManager.shared.getAnimation(person: world.player) {
            var stateAnimationDuration = 1
            switch world.player.state {
            case .Idle: break
            case .Walking:
                stateAnimationDuration = Config.animationWalkGameTickDuration
            }

            let progressPercentage = CGFloat(world.player.stateDurationElapsed)/CGFloat(stateAnimationDuration)
            world.player.applyAnimationFrame(animation.getFrame(animationProgress: progressPercentage))
        }
    }
}
