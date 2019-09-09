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
            world.player.applyAnimationFrame(animation.getFrame(timeElapsed: 0))
        }
    }
}
