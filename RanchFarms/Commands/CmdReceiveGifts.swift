class CmdReceiveGifts: Command {
    let world: World
    let gifts: [Gift]


    init(world: World, gifts: [Gift]) {
        self.world = world
        self.gifts = gifts
    }

    convenience init(world: World, gift: Gift) {
        var gifts = [Gift]()
        gifts.append(gift)
        self.init(world: world, gifts: gifts)
    }

    func execute() {
        for gift in gifts {
            switch gift.type {
            case .Item:
                for item in gift.items {
                    if world.player.inventory.canAcquire(item: item) {
                        world.player.inventory.acquire(item: item)
                    } else {
                        // TODO: Send it to the mailbox
                    }
                }
            }
        }
    }
}
