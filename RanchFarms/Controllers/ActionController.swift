import SpriteKit

class ActionController {
    let world: World!

    let inputController: InputController!
    let hudController: HudController!

    init(world: World,  hudController: HudController, inputController: InputController) {
        self.world = world

        self.hudController = hudController
        self.inputController = inputController

        assignActions()
    }

    private func assignActions() {
        inputController.handleMove = actionMove
        inputController.handlePrimary[.ClickDown] = actionPrimary
        inputController.handleCancel[.ClickDown] = actionCancel
        inputController.handleMenu[.ClickDown] = actionMenu
        inputController.handleUse[.ClickDown] = actionUse

        inputController.handleSwitchLeft[.ClickDown] = actionSwitchLeft
        inputController.handleSwitchRight[.ClickDown] = actionSwitchRight
    }

    func actionMove(moveVector: CGVector) {
        if !moveVector.isZeroVector {
            let initPosition = world.player.position
            world.player.position = world.player.position + moveVector.scale(world.player.moveSpeed)
            world.player.faceDirection = CGVector.getDirection4(start: initPosition, end: world.player.position)
        }
    }

    func actionPrimary() {
        let currentGameArea = world.getCurrentGameArea()

        let buildings = currentGameArea.buildings.filter({$0.contains(world.player.getPositionInFront())})

        if let teleport = buildings.filter({$0.type == .Teleport}).first {
            world.teleport(to: teleport.teleport!)
        } else if let _ = buildings.filter({$0.type == .Bed}).first {
            let cmdEndDay  = CmdEndDay(world: world)
            cmdEndDay.execute()

            let cmdStartDay = CmdStartDay(world: world)
            cmdStartDay.execute()
        }
    }

    func actionCancel() {
    }

    func actionMenu() {
        switch world.hudInterfaceData.gameState {
        case .Game:
            world.hudInterfaceData.gameState = .Inventory
        case .Inventory:
            world.hudInterfaceData.gameState = .Game
        }
    }

    func actionUse() {
        let cmdActionUseItem  = CmdActionUseItem(world: world)
        cmdActionUseItem.execute()
    }

    func actionSwitchLeft() {
        world.hudInterfaceData.changeHotBarIndexLeft()
    }

    func actionSwitchRight() {
        world.hudInterfaceData.changeHotBarIndexRight()
    }
}
