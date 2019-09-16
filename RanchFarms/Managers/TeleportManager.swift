import SpriteKit

class TeleportManager {
    static let shared = TeleportManager()

    private var teleportMap = [TeleportId: Teleport]()

    private init() {
        loadTeleports()
    }

    private func loadTeleports() {
        teleportMap[TeleportId.House_Bed] = Teleport(mapPoint: MapPoint(x: 7, y: 1, location: .House), directionToFace: .SOUTH)
        teleportMap[TeleportId.House_Farm] = Teleport(mapPoint: MapPoint(x: 3, y: 5, location: .Farm), directionToFace: .SOUTH)

        teleportMap[TeleportId.Farm_House] = Teleport(mapPoint: MapPoint(x: 1, y: 0, location: .House), directionToFace: .NORTH)
        teleportMap[TeleportId.Farm_Town] = Teleport(mapPoint: MapPoint(x: 0, y: 0, location: .Town), directionToFace: .EAST)

        teleportMap[TeleportId.Town_Farm] = Teleport(mapPoint: MapPoint(x: 5, y: 3, location: .Farm), directionToFace: .WEST)
    }

    func getTeleport(teleportId: TeleportId) -> Teleport? {
        if teleportMap[teleportId] == nil {
            print ("[TextureManager] [Desc=No Teleport] [TeleportId=\(teleportId)]")
        } else {
            return teleportMap[teleportId]
        }
        return nil
    }
}
