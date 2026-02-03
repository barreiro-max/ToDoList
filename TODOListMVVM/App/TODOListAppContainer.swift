import SwiftData

@MainActor
struct TODOListAppContainer {
    static func makeTODOListViewModel() -> TODOListViewModel {
        let schema = Schema([TaskEntity.self])
        let config = ModelConfiguration("ListDataBase", isStoredInMemoryOnly: false)
        let container = try! ModelContainer(for: schema, configurations: config)
        
        let taskService = TaskServiceData(container: container, context: container.mainContext)
        let repo = TaskRepository(taskService: taskService)
        
        return TODOListViewModel(repository: repo)
    }
}

