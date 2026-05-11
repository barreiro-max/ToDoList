import OSLog

enum Logger {
    static let subsystem = "com.example.ToDoList_OOP"

    static let data = os.Logger(subsystem: subsystem, category: "Data")
    static let viewModel = os.Logger(subsystem: subsystem, category: "ViewModel")
}
