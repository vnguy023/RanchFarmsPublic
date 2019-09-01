import SpriteKit

struct Teleport {
    let mapPoint: MapPoint
    let directionToFace: CGVector

    var location: Location {
        get {return mapPoint.location}
    }

    init(mapPoint: MapPoint, directionToFace: CGVector) {
        self.mapPoint = mapPoint
        self.directionToFace = directionToFace
    }
}
