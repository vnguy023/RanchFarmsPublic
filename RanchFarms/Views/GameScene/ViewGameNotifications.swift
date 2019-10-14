import SpriteKit

class ViewGameNotifications: SKNode, Observer {
    internal var subject: ObserverSubject?

    func update(event: ObserverEvent) {
        if let notification = event as? EventReceiveItem {
            print ("[ViewGameNotification] [itemName=\(notification.item.info.name)]")
        }
    }

    override init() {
        super.init()
    }

    deinit {
        unsubscribe()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
