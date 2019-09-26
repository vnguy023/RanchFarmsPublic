import SpriteKit

struct Teleport {
    let id: TeleportId

    let mapPoint: MapPoint
    let directionToFace: CGVector

    var location: Location {
        get {return mapPoint.location}
    }

    init(teleportId: TeleportId, mapPoint: MapPoint, directionToFace: CGVector) {
        self.id = teleportId
        self.mapPoint = mapPoint
        self.directionToFace = directionToFace
    }
}
