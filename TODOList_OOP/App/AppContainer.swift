import SwiftData

@MainActor
final class AppContainer {

    func makeToDoListViewModel() -> ToDoListViewModel {
        let repository = TaskRepositoryImpl(modelContainer: modelContainer)
        return ToDoListViewModel(repository: repository)
    }

    private lazy var modelContainer: ModelContainer = {
        let schema = Schema([TaskEntity.self])

        let config = ModelConfiguration(
            "ListDataBase",
            schema: schema,
            isStoredInMemoryOnly: false
        )
        do {
            return try ModelContainer(
                for: schema,
                configurations: config
            )
        } catch {
            fatalError("Failed to create ModelContainer")
        }
    }()
}
