import SpriteKit

class GameEventsTimeSystem: BaseSystem{
    let scene: GameScene!
    let world: World!

    init(gameScene: GameScene, world: World) {
        self.scene = gameScene
        self.world = world

        super.init(updateTickInterval: 1)
    }

    override func process() {
        for gameEvent in GameEventManager.shared.getGameEventsTriggered(currentTime: world.gameTicksElapsedToday) {
            let cmdValidate = CmdValidateRequirements(requirements: gameEvent.requirements, world: world, person: world.player)
            cmdValidate.execute()
            if !cmdValidate.success {
                continue
            }

            switch gameEvent.type {
            case .Sleep:
                scene.vc.loadEndDayScene(world: world)
                return
            case .Dialog: fallthrough
            case .Store: fallthrough
            case .Teleport: fallthrough
            default:
                print ("[GameEventsTimeSystem] [Error=gameEvent type not handled] [type=\(gameEvent.type)]")
            }
        }
    }
}
