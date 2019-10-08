class MemoryBank {
    var dialogIdsSeen: [DialogId]

    init(dialogIdsSeen: [DialogId]) {
        self.dialogIdsSeen = dialogIdsSeen
    }

    convenience init(data: MemoryBankData) {
        self.init(dialogIdsSeen: data.dialogIdsSeen)
    }

    func getMemoryBankData() -> MemoryBankData {
        return MemoryBankData(dialogIdsSeen: dialogIdsSeen)
    }
}
