import Foundation

@MainActor
@Observable
final class ToDoListViewModel {

    enum State: CustomStringConvertible {
        case loading, loaded, error(String)

        var description: String {
            switch self {
            case .loading: "loading"
            case .loaded: "loaded"
            case let .error(err): "error: \(err)"
            }
        }
    }

    private(set) var state: State = .loading

    private(set) var entities: [TaskEntity] = []

    fileprivate enum TaskType: String, CustomStringConvertible {
        case create, read, delete, filter, save

        var description: String { rawValue }
    }

    private var tasks: [TaskType: Task<Void, Never>] = [:]

    private let repository: TaskGateway

    init(repository: TaskGateway) {
        self.repository = repository
    }

    func onAppear() {
        read()
    }

    func onDisappear() {
        save()
    }

    func create(title: String, aboutTitle: String) {
        runTask(.create) {
            let task = TaskEntity(title: title, aboutTitle: aboutTitle)
            self.entities.append(task)
            try await self.repository.insert(task: task)
        }
    }

    func read() {
        runTask(.read) {
            self.entities = try await self.repository.fetchAllTasks()
        }
    }

    func delete(task: TaskEntity) {
        runTask(.delete) {
            if let index = self.entities.firstIndex(
                where: { $0.id == task.id }
            ) {
                self.entities.remove(at: index)
            }
            try await self.repository.delete(task)
        }
    }

    func filter(by isDone: Bool) {
        runTask(.filter) {
            if !self.entities.isEmpty {
                self.entities = try await self.repository.filter(isDone: isDone)
            }
        }
    }
    
    func save() {
        runTask(.save) {
            try await self.repository.save()
        }
    }

    private func runTask(
        _ type: TaskType,
        operation: @escaping () async throws -> Void
    ) {
        tasks[type]?.cancel()

        tasks[type] = Task {
            do {
                try Task.checkCancellation()
                try await operation()

                state = .loaded

                // swiftlint:disable line_length
                Logger.viewModel.info("ViewModel Success runTask: state=\(self.state), taskType=\(type), count=\(self.entities.count)")
                // swiftlint:enable line_length
            } catch {
                handleError(by: error, for: type)
            }
        }
    }

    @MainActor
    deinit {
        for task in tasks.values {
            task.cancel()
        }
    }
}

extension ToDoListViewModel {

    fileprivate func handleError(by error: Error, for type: TaskType) {
        guard !Task.isCancelled else {
            Logger.viewModel.warning("Task cancelled: \(error.localizedDescription), taskType:\(type)")
            return
        }

        // swiftlint:disable line_length
        Logger.viewModel.fault("ViewModel Error runTask: state=\(self.state), taskType=\(type), error=\(error.localizedDescription)")
        // swiftlint:enable line_length

        state = .error(error.localizedDescription)
    }
}
