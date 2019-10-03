import Foundation

class CmdSaveGame: Command {
    // Input
    let worldData: WorldData
    let saveSlot: SaveSlot

    // Output
    var world: World! = nil
    var result = Result.AwaitingExecution

    enum Result {
        case AwaitingExecution
        case Success

        case UnableToSave
        case UnableToVerifyLoad
    }

    init(worldData: WorldData, saveSlot: SaveSlot) {
        self.worldData = worldData
        self.saveSlot = saveSlot
    }

    func execute() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        var saveData: String! = nil
        do {
            let data = try encoder.encode(worldData)
            saveData = String(data: data, encoding: .utf8)!
            save(text: saveData, saveSlot: SaveSlot.Temp)
        } catch {
            result = .UnableToSave
            print("[\(type(of: CmdSaveGame.self))] [Error:\(#function)]")
        }

        let cmdLoadGameTemp = CmdLoadGame(saveSlot: SaveSlot.Temp)
        cmdLoadGameTemp.execute()

        switch cmdLoadGameTemp.result {
        case .Success:
            save(text: saveData, saveSlot: saveSlot)
        default:
            result = .UnableToVerifyLoad
            print ("[CmdSaveGame] [Error=Loading File Temp] [Result\(cmdLoadGameTemp.result)]")
            return
        }

        let cmdLoadGame = CmdLoadGame(saveSlot: saveSlot)
        cmdLoadGame.execute()

        switch cmdLoadGame.result {
        case .Success:
            result = .Success
            world = cmdLoadGame.world
        default:
            result = .UnableToVerifyLoad
            print ("[CmdSaveGame] [Error=Loading File, Critical] [Result\(cmdLoadGame.result)]")
            return
        }
    }

    private func save(text: String, saveSlot: SaveSlot) {
        let cmdSaveFile = CmdSaveFile(directory: Config.SaveDirectory, fileName: saveSlot.getFileName(), fileExtension: Config.SaveFileExtension, text: text)
        cmdSaveFile.execute()
    }
}
