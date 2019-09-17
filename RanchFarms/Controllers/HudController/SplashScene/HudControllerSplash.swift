import SpriteKit

class HudControllerSplash{
    let screenSize: CGSize

    let node = SKNode()
    
    let hudInterfaceData: HudInterfaceDataSplash

    // Hud Overlay
    // -- Splash Views
    let viewSplash = ViewSplash()

    // -- SelectSave Views
    let viewSaveFiles = ViewSaveFiles()

    init(hudInterfaceDataSplash: HudInterfaceDataSplash, screenSize: CGSize) {
        self.hudInterfaceData = hudInterfaceDataSplash
        self.screenSize = screenSize

        self.node.addChild(viewSplash)

        self.node.addChild(viewSaveFiles)

        update()
    }

    func update() {
        if hudInterfaceData.state == .Splash {
            viewSplash.isHidden = false
            viewSplash.update()
        } else {
            viewSplash.isHidden = true
        }

        if hudInterfaceData.state == .SelectSave {
            viewSaveFiles.isHidden = false
            viewSaveFiles.update()
        } else {
            viewSaveFiles.isHidden = true
        }
    }
}
