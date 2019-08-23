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
        world.player.texture = AnimationManager.shared.getTexture(person: world.player)
    }
}
