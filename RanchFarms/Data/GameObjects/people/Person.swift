import SpriteKit

class Person: GameObject {
    let id: PersonId

    enum State {
        case Idle
    }

    var state = State.Idle

    init(personId: PersonId, mapPoint: MapPoint) {
        self.id = personId
        super.init(mapPoint: mapPoint)

        self.zPosition = 500
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func applyAnimationFrame(_ frame: AnimationFrame) {
        self.sprite.texture = frame.texture
        self.sprite.size = frame.imageSize
        self.sprite.anchorPoint = frame.anchorPoint
        self.sprite.position = frame.positionOffset
    }
}
