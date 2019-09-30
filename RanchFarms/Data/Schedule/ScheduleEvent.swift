import SpriteKit

class ScheduleEvent {
    let startTime: GameTick
    let destination: MapPoint
    let teleport: Bool
    let faceDirection: CGVector
    let stateAtDestination: Person.State

    init(startTime: GameTick, destination: MapPoint, teleport: Bool, facedirection: CGVector, stateAtDestination: Person.State) {
        self.startTime = startTime
        self.destination = destination
        self.teleport = teleport
        self.faceDirection = facedirection
        self.stateAtDestination = stateAtDestination
    }
}
