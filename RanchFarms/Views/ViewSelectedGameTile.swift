import SpriteKit

class ViewSelectedGameTile: SKSpriteNode {
    let world: World

    var player: Person {
        get {return world.player}
    }

    init(world: World) {
        self.world = world

        super.init(texture: nil, color: .red, size: Config.tileSize)

        texture = TextureManager.shared.getTexture(hudImageName: "hudTileCursor")

        update()
    }

    func update() {
        if let tileInfront = world.getTileAt(position: player.getPositionInFront(), location: player.location) {
            self.isHidden = false

            self.position = tileInfront.position
        } else {
            self.isHidden = true
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
