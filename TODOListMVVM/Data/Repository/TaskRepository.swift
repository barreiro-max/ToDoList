import Foundation

protocol TaskRepositoryProtocol {
    func insert(task: TaskEntity)
    
    func delete(_ task: TaskEntity)
    
    func fetchAllTasks() throws -> [TaskEntity]?
    
    func filter(isDone: Bool) throws -> [TaskEntity]?
    
    func save() throws
}

final class TaskRepository: TaskRepositoryProtocol {
    private let taskServiceData: any TaskServiceDataProtocol
    
    init(taskService: some TaskServiceDataProtocol) {
        self.taskServiceData = taskService
    }
    
    func insert(task: TaskEntity = TaskEntity()) {
        taskServiceData.insert(task: task)
    }
    
    func delete(_ task: TaskEntity) {
        taskServiceData.delete(task)
    }
    
    func fetchAllTasks() throws -> [TaskEntity]? {
        return try taskServiceData.fetchAllTasks()
    }
    
    func filter(isDone: Bool) throws -> [TaskEntity]? {
        return try taskServiceData.filter(isDone: isDone)
    }
    
    func save() throws {
        return try taskServiceData.save()
    }

}
