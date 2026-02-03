import Foundation

@MainActor
final class TODOListViewModel: ObservableObject {
    @Published var tasks: [TaskEntity] = []
    
    @Published var taskError: String?
    
    private let repository: any TaskRepositoryProtocol
    
    init(repository: some TaskRepositoryProtocol) {
        self.repository = repository
    }
    
    func insert(task: TaskEntity =  TaskEntity()) {
        repository.insert(task: task)
        self.fetchAllTasks()
    }
    
    func delete(at offsets: IndexSet) {
        if let lastTask = tasks.last {
            repository.delete(lastTask)
            tasks.remove(atOffsets: offsets)
        }
    }
    
    func delete(task: TaskEntity) {
        repository.delete(task)
        tasks.removeAll { $0.id == task.id }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func filter(isDone: Bool) {
        do {
            self.tasks = try repository.filter(isDone: isDone)!
        } catch {
            taskError = error.localizedDescription
        }
    }
    
    func fetchAllTasks() {
        do {
            self.tasks = try repository.fetchAllTasks()!
        } catch {
            self.taskError = error.localizedDescription
        }
    }
    
    func save() {
        do {
            try repository.save()
        } catch {
            self.taskError = error.localizedDescription
        }
    }
    
    func edit(details: String, task: TaskEntity) {
        task.infoTitle = details
        self.save()
    }
    
    func edit(title: String, task: TaskEntity) {
        task.title = title
        self.save()
    }
    
    func complete(task: TaskEntity) {
        task.isCompleted.toggle()
    }
    
}
