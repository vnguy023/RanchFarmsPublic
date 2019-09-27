import SpriteKit

class NPCScheduleSystem: BaseSystem {
    let world: World!

    init(world: World) {
        self.world = world

        super.init(updateTickInterval: Config.teleportSystemUpdateInterval)
    }

    override func process() {
        for npc in world.npcs {
            var spawnPoint: Teleport? = nil

            switch npc.id {
            case .Lily:
                spawnPoint = TeleportManager.shared.getTeleport(teleportId: .Lily_Spawn)
            default:
                print ("[NPCScheduleSystem] [Desc=SpawnTeleport not handled] [id=\(npc.id)] ")
            }

            if spawnPoint != nil {
                npc.teleport(to: spawnPoint!)
            }
        }
    }
}
