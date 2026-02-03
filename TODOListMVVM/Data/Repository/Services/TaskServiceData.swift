import Foundation
import SwiftData


protocol TaskServiceDataProtocol {
    func insert(task: TaskEntity)
    
    func delete(_ task: TaskEntity)
    
    func fetchAllTasks() throws -> [TaskEntity]?
    
    func filter(isDone: Bool) throws -> [TaskEntity]?
    
    func save() throws
}

struct TaskServiceData: TaskServiceDataProtocol {
    private let container: ModelContainer?
    private let context: ModelContext?
        
    init(container: ModelContainer?, context: ModelContext?) {
        self.container = container
        self.context = context
    }
    
    func insert(task: TaskEntity = TaskEntity()) {
        context?.insert(task)
        try? context?.save()
    }

    func delete(_ task: TaskEntity) {
        context?.delete(task)
        try? context?.save()
    }
    
    func fetchAllTasks() throws -> [TaskEntity]? {
        let descriptor = FetchDescriptor<TaskEntity>(
            sortBy: [SortDescriptor(
                \TaskEntity.createdAt,
                 order: .forward
            )]
        )
        return try context?.fetch(descriptor)
    }
    
    func filter(isDone: Bool) throws -> [TaskEntity]? {
        let predicate = #Predicate<TaskEntity> {
            $0.isCompleted == isDone
        }
        
        let descriptor = FetchDescriptor<TaskEntity>(predicate: predicate)
        
        return try context?.fetch(descriptor)
        
    }
    
    func save() throws {
        try context?.save()
    }
    
}

