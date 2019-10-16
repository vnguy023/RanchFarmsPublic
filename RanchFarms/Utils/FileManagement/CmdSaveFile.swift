import SpriteKit

class CmdSaveFile: Command {
    // Input
    let directory: String
    let fileName: String
    let fileExtension: String
    let text: String

    // Output
    var success = false

    init(directory: String, fileName: String, fileExtension: String, text: String) {
        self.directory = directory
        self.fileName = fileName
        self.fileExtension = fileExtension
        self.text = text
    }

    func execute() {
        let fileManager = FileManager.default

        do {
            // everything will exist under document directory
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:true)

            var saveDirectoryUrl = documentDirectory
            if !directory.isEmpty {
                saveDirectoryUrl = documentDirectory.appendingPathComponent(directory, isDirectory: true)
            }

            // create the directory if it doesn't exist
            try fileManager.createDirectory(at: saveDirectoryUrl.absoluteURL, withIntermediateDirectories: true, attributes: nil)

            let saveFileUrl = saveDirectoryUrl.appendingPathComponent(fileName, isDirectory: false).appendingPathExtension(fileExtension)

            if let data = text.data(using: .utf8){
                try data.write(to: saveFileUrl)

                print("[CmdSave] [Desc=Sucessfully saved file] [Path=\(saveFileUrl.absoluteString)]")
                success = true
            }
        } catch {
            print("[CmdSave] [Desc=Failed to save file] [BaseDirectory=\(directory)] [FileName=\(fileName).\(fileExtension)]")
            print(error)
        }
    }
}
