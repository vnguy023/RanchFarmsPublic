import SpriteKit

class ViewGameNotifications: SKNode, Observer {
    internal var subject: ObserverSubject?

    var itemNotificationsDisplayed = [ViewGameNotificationItem]()

    func update(event: ObserverEvent) {
        if let notification = event as? EventReceiveItem {
            addEventReceiveItem(notification: notification)
        }
    }

    override init() {
        super.init()
    }

    private func addEventReceiveItem(notification: EventReceiveItem) {
        // TODO: Test - Consolidation, sorting, maxCount

        let sameItemIdNotification = itemNotificationsDisplayed.filter({$0.item.id == notification.item.id})

        if sameItemIdNotification.isEmpty {
            // no existing notification
            let notificationItem = ViewGameNotificationItem(item: notification.item)
            itemNotificationsDisplayed.append(notificationItem)
            self.addChild(notificationItem)
        } else {
            // consolidate items
            let item = sameItemIdNotification.first!

            item.item.quantity += notification.item.quantity
            item.itemSprite.setItem(item: item.item)
        }

        itemNotificationsDisplayed.sort(by: {$0.timeLeftToDisplay > $1.timeLeftToDisplay})

        while itemNotificationsDisplayed.count > 5 {
            let itemToDelete = itemNotificationsDisplayed.removeLast()
            itemToDelete.removeFromParent()
        }
    }

    func update() {
        itemNotificationsDisplayed.forEach({
            $0.update()
            if $0.timeLeftToDisplay <= 0 { $0.removeFromParent() }
        })

        itemNotificationsDisplayed = itemNotificationsDisplayed.filter({$0.timeLeftToDisplay > 0})

        for index in 0..<itemNotificationsDisplayed.count {
            let item = itemNotificationsDisplayed[index]
            item.position = CGPoint(x: Config.screenSize.width / -2 + item.size.width/2,
                                    y: Config.screenSize.height / -2 + item.size.height/2 + 80)
            item.position.y += (item.size.height + 4) * CGFloat(index)
        }
    }

    deinit {
        unsubscribe()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
