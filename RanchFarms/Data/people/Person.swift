import SpriteKit

class Person: GameObject {
    override init(position: CGPoint, location: Location) {
        super.init(position: position, location: location)

        self.texture = SKTexture(imageNamed: "personLily")
        self.texture!.filteringMode = .nearest

        self.zPosition = 100
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
