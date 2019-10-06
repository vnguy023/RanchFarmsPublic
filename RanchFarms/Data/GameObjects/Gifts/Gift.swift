class Gift {
    let type: GiftType

    let items: [Item]

    init(giftType: GiftType, items: [Item]) {
        self.type = giftType
        self.items = items
    }
}
