import SpriteKit

class Person: GameObject {
    let id: PersonId

    enum State {
        case Idle
        case Walking
    }

    var state = State.Idle
    var stateDurationElapsed = Int(0) // GameTicks since we stateChanged

    var previousLocation = Location.House
    var previousPosition = CGPoint()

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

    func move(direction: CGVector) {
        if state == .Idle {
            state = .Walking
            stateDurationElapsed = 0
        }

        let initPosition = position
        position = position + direction.scale(moveSpeed)
        
        faceDirection = CGVector.getDirection4(start: initPosition, end: position)
    }
}
