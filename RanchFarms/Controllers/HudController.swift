import SpriteKit

class HudController{
    let screenSize: CGSize

    let world: World!

    let camera: SKCameraNode!

    let viewInventoryHotbar: ViewInventoryHotbar

    init(camera: SKCameraNode, world: World, screenSize: CGSize) {
        self.screenSize = screenSize

        self.camera = camera
        self.world = world

        viewInventoryHotbar = ViewInventoryHotbar(inventory: world.player.inventory)
        viewInventoryHotbar.position.y = screenSize.height / -2 + viewInventoryHotbar.size.height/2
        camera.addChild(viewInventoryHotbar)
    }

    func update() {
        viewInventoryHotbar.update()
    }
}
