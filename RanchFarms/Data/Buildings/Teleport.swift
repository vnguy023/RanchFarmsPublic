import SpriteKit

struct Teleport {
    let position: CGPoint
    let location: Location
    let directionToFace: CGVector

    init(position: CGPoint, location: Location, directionToFace: CGVector) {
        self.position = position
        self.location = location
        self.directionToFace = directionToFace
    }
}
