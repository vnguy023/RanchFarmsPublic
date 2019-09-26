import SpriteKit

class TeleportManager {
    static let shared = TeleportManager()

    private var teleportMap = [TeleportId: Teleport]()

    private init() {
        GameData.getTeleports().forEach({teleportMap[$0.id] = $0})
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
