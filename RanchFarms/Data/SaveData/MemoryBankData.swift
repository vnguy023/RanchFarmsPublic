class MemoryBankData: Codable {
    var dialogIdsSeenCount: [DialogId: Int]
    var gameEventsSeenCount: [GameEventId: Int]

    init(gameEventsSeenCount: [GameEventId: Int], dialogIdsSeenCount: [DialogId: Int]){
        self.gameEventsSeenCount = gameEventsSeenCount
        self.dialogIdsSeenCount = dialogIdsSeenCount
    }
}
