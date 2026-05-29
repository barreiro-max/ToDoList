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
        let task = TaskEntity(title: title, aboutTitle: aboutTitle)
        let repository = self.repository

        runTask(.create) { [weak self] in
            if let self {
                entities.append(task)
            }

            try await repository.insert(task: task)
        }
    }

    func read() {
        runTask(.read) { [weak self] in
            guard let self else { return }
            entities = try await repository.fetchAllTasks()
        }
    }

    func delete(task: TaskEntity) {
        let repository = self.repository

        runTask(.delete) { [weak self] in
            if let self {
                entities.removeAll { $0.id == task.id }
            }

            try await repository.delete(task)
        }
    }

    func filter(by isDone: Bool) {
        runTask(.filter) { [weak self] in
            guard let self else { return }

            if !entities.isEmpty {
                entities = try await repository.filter(isDone: isDone)
            }
        }
    }
    
    func save() {
        let repository = self.repository

        runTask(.save) {
            try await repository.save()
        }
    }

    private func runTask(
        _ type: TaskType,
        operation: @escaping () async throws -> Void
    ) {
        tasks[type]?.cancel()

        tasks[type] = Task { [weak self] in
            do {
                try await operation()

                guard let self else { return }
                state = .loaded

                // swiftlint:disable line_length
                Logger.viewModel.info("ViewModel Success runTask: state=\(self.state), taskType=\(type), count=\(self.entities.count)")
                // swiftlint:enable line_length
            } catch {
                guard !Task.isCancelled else {
                    Logger.viewModel.warning("Task cancelled: \(error.localizedDescription), taskType:\(type)")
                    return
                }

                guard let self else { return }
                state = .error(error.localizedDescription)

                // swiftlint:disable line_length
                Logger.viewModel.fault("ViewModel Error runTask: state=\(state), taskType=\(type), error=\(error.localizedDescription)")
                // swiftlint:enable line_length
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
