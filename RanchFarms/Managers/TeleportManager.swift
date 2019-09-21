import SpriteKit

class TeleportManager {
    static let shared = TeleportManager()

    private var teleportMap = [TeleportId: Teleport]()

    private init() {
        loadTeleports()
    }

    private func loadTeleports() {
        teleportMap[.House_Bed] = Teleport(mapPoint: MapPoint(x: 7, y: 1, location: .House), directionToFace: .SOUTH)
        teleportMap[.House_Farm] = Teleport(mapPoint: MapPoint(x: 3, y: 6, location: .Farm), directionToFace: .SOUTH)

        teleportMap[.Farm_House] = Teleport(mapPoint: MapPoint(x: 1, y: 0, location: .House), directionToFace: .NORTH)
        teleportMap[.Farm_Town] = Teleport(mapPoint: MapPoint(x: 0, y: 0, location: .Town), directionToFace: .EAST)

        teleportMap[.Town_Farm] = Teleport(mapPoint: MapPoint(x: 5, y: 3, location: .Farm), directionToFace: .WEST)
        teleportMap[.Town_GeneralStore] = Teleport(mapPoint: MapPoint(x: 1, y: 0, location: .GeneralStore), directionToFace: .NORTH)

        teleportMap[.GeneralStore_Town] = Teleport(mapPoint: MapPoint(x: 2, y: 5, location: .Town), directionToFace: .SOUTH)
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
