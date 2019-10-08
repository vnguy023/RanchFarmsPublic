class MemoryBank {
    private var dialogIdsSeenCount: [DialogId: Int] // records number of times a dialog has been seen
    private var gameEventsSeenCount: [GameEventId: Int] // records number of times a gameEvent has been seen

    init(gameEventsSeenCount: [GameEventId: Int], dialogIdsSeenCount: [DialogId: Int]) {
        self.gameEventsSeenCount = gameEventsSeenCount
        self.dialogIdsSeenCount = dialogIdsSeenCount
    }

    convenience init(data: MemoryBankData) {
        self.init(gameEventsSeenCount: data.gameEventsSeenCount, dialogIdsSeenCount: data.dialogIdsSeenCount)
    }

    func getMemoryBankData() -> MemoryBankData {
        return MemoryBankData(gameEventsSeenCount: gameEventsSeenCount, dialogIdsSeenCount: dialogIdsSeenCount)
    }

    func hasSeen(dialogId: DialogId) -> Bool {
        if let count = dialogIdsSeenCount[dialogId], count > 0 {
            return true
        }

        return false
    }

    func recordSeen(dialogId: DialogId) {
        if !hasSeen(dialogId: dialogId) {
            dialogIdsSeenCount[dialogId] = 0
        }
        dialogIdsSeenCount[dialogId]! += 1
    }

    func hasSeen(gameEventId: GameEventId) -> Bool {
        if let count = gameEventsSeenCount[gameEventId], count > 0 {
            return true
        }

        return false
    }

    func recordSeen(gameEventId: GameEventId) {
        if !hasSeen(gameEventId: gameEventId) {
            gameEventsSeenCount[gameEventId] = 0
        }
        gameEventsSeenCount[gameEventId]! += 1
    }
}
