// This is only ever meant to be parsed from WorldData jsonFile for basic info
class SaveDataInfo: Codable {
    let money: Int
    let daysElapsed: Int

    init(money: Int, daysElapsed: Int) {
        self.money = money
        self.daysElapsed = daysElapsed
    }
}
