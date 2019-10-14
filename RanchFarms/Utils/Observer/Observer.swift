protocol Observer: class {
    // TODO: Think about being able to observer multiple subjects
    var subject: ObserverSubject? {get set}

    func update(event: ObserverEvent)

    // make sure to implement this
    //deinit{ unsubscribe() }
}

extension Observer {
    func subscribe(subject: ObserverSubject) {
        if self.subject != nil {
            unsubscribe()
        }
        self.subject = subject.subscribe(observer: self)
    }

    func unsubscribe() {
        if subject != nil {
            subject!.unsubscribe(observer: self)
            subject = nil
        }
    }
}
