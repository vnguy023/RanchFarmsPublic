import SpriteKit

class HudController{
    let screenSize: CGSize

    let world: World!

    let camera: SKCameraNode!

    let viewInventory: ViewInventory

    init(camera: SKCameraNode, world: World, screenSize: CGSize) {
        self.screenSize = screenSize

        self.camera = camera
        self.world = world

        viewInventory = ViewInventory(inventory: world.player.inventory)
        viewInventory.position.y = screenSize.height / -2 + viewInventory.size.height/2
        camera.addChild(viewInventory)
    }

    func update() {
        viewInventory.update()
    }
}
