class BaseSystem {
    var lastUpdate = GameTick()
    var nextProcessTime = GameTick()

    let updateTickInterval: GameTick

    init(updateTickInterval: GameTick) {
        self.updateTickInterval = updateTickInterval
    }

    func update() {
        lastUpdate += 1
        if lastUpdate >= nextProcessTime {
            process()
            nextProcessTime = lastUpdate + updateTickInterval
        }
    }

    func reset() {
        lastUpdate = GameTick(0)
        nextProcessTime = GameTick(0)
    }

    func process() {
    }
}
