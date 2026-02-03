import SwiftData

@MainActor
extension TODOListViewModel {
    static var preview: TODOListViewModel {
        let schema = Schema([TaskEntity.self])
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: schema, configurations: config)
        let context = container.mainContext
        
        let taskService = TaskServiceData(container: container, context: context)
        let repo = TaskRepository(taskService: taskService)
        
        let vm = TODOListViewModel(repository: repo)
    
        for task in TaskEntity.mocks {
            vm.insert(task: task)
        }
        
        return vm
    }
}
