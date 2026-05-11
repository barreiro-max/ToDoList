import Foundation
import SwiftData

protocol TaskGateway: ModelActor {

    func insert(task: TaskEntity) throws

    func delete(_ task: TaskEntity) throws

    func fetchLastTask() throws -> TaskEntity?

    func fetchAllTasks() throws -> [TaskEntity]

    func filter(isDone: Bool) throws -> [TaskEntity]

    func save() throws
}

@ModelActor
actor TaskRepositoryImpl: TaskGateway {

    func insert(task: TaskEntity) throws {
        modelContext.insert(task)
        Logger.data.info("Task inserted: id=\(task.id)")
        try save()
    }

    func delete(_ task: TaskEntity) throws {
        modelContext.delete(task)
        Logger.data.info("Task deleted: id=\(task.id)")
        try save()
    }

    func fetchLastTask() throws -> TaskEntity? {
        var descriptor = FetchDescriptor<TaskEntity>(
            sortBy: [SortDescriptor(\.createdAt, order: .reverse)]
        )

        descriptor.fetchLimit = 1

        if let fetchedTask = try modelContext.fetch(descriptor).first {
            Logger.data.info("Last task fetched from repository: id=\(fetchedTask.id)")
            return fetchedTask
        }
        Logger.data.warning("Last task is not fetched from repository. id=nil")
        return nil
    }

    func fetchAllTasks() throws -> [TaskEntity] {
        let sortDescriptor = SortDescriptor(
            \TaskEntity.createdAt,
             order: .forward
        )

        let descriptor = FetchDescriptor<TaskEntity>(
            sortBy: [sortDescriptor]
        )

        let fetchedTasks = try modelContext.fetch(descriptor)
#if DEBUG
        let count = try modelContext.fetchCount(descriptor)
        Logger.data.info("Tasks fetched from repository: count=\(count, privacy: .public)")
#endif
        return fetchedTasks
    }
    
    func filter(isDone: Bool) throws -> [TaskEntity] {
        let predicate = #Predicate<TaskEntity> {
            $0.isCompleted == isDone
        }
        
        let descriptor = FetchDescriptor<TaskEntity>(predicate: predicate)

        let filteredTasks = try modelContext.fetch(descriptor)
#if DEBUG
        let count = try modelContext.fetchCount(descriptor)
        Logger.data.info("Tasks filtered from repository: count=\(count)")
#endif
        return filteredTasks
    }
    
    func save() throws {
        if modelContext.hasChanges {
            try modelContext.save()
            Logger.data.info("Tasks saved in SwiftData ModelContext")
        }
    }
}
