class MemoryBankData: Codable {
    var dialogIdsSeen: [DialogId]

    init(dialogIdsSeen: [DialogId]){
        self.dialogIdsSeen = dialogIdsSeen
    }
}
