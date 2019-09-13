import Foundation

class CmdSaveGame: Command {
    let world: World

    init(world: World) {
        self.world = world
    }

    func execute() {
        let worldData = world.getWorldData()

        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            let data = try encoder.encode(worldData)
            let saveData = String(data: data, encoding: .utf8)!
            save(text: saveData)
        } catch {
            print("[\(type(of: CmdSaveGame.self))] [Error:\(#function)]")
        }
    }

    private func save(text: String) {
        let cmdSaveFile = CmdSaveFile(directory: Config.SaveDirectory, fileName: world.saveSlot.getFileName(), fileExtension: Config.SaveFileExtension, text: text)
        cmdSaveFile.execute()
    }
}
