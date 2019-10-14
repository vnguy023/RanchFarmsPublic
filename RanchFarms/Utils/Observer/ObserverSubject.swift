class ObserverSubject {
    private var observers = [Observer]()

    init() {}

    func subscribe(observer: Observer) -> ObserverSubject {
        observers.append(observer)
        return self
    }

    func notify(event: ObserverEvent) {
        observers.forEach({$0.update(event: event)})
    }

    func unsubscribe(observer: Observer) {
        observers = observers.filter({$0 !== observer})
    }

    deinit {
        observers.forEach({$0.unsubscribe()})
    }
}
