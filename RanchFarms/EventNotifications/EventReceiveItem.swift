struct EventReceiveItem: ObserverEvent {
    let item: Item

    init(item: Item) {
        self.item = item
    }

}
