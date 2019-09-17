import Foundation

class CmdSaveGame: Command {
    let worldData: WorldData
    let saveSlot: SaveSlot

    init(worldData: WorldData, saveSlot: SaveSlot) {
        self.worldData = worldData
        self.saveSlot = saveSlot
    }

    func execute() {
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
        let cmdSaveFile = CmdSaveFile(directory: Config.SaveDirectory, fileName: saveSlot.getFileName(), fileExtension: Config.SaveFileExtension, text: text)
        cmdSaveFile.execute()
    }
}
