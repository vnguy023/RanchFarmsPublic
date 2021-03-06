enum DialogId: UInt, Codable {
    case Unknown = 0
    case Dummy
    case Door_IsLocked
    case Store_IsClosed

    // Temporary
    case VendingMachine

    // Lily
    case Lily_Greeting
    case Lily_Talk

    // James
    case James_Greeting
    case James_Talk

}
