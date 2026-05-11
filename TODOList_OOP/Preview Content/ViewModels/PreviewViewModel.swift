import SwiftData

@MainActor
extension ToDoListViewModel {

    static var preview: ToDoListViewModel {
        let schema = Schema([TaskEntity.self])
        let config = ModelConfiguration(isStoredInMemoryOnly: true)

        do {
            let container = try ModelContainer(for: schema, configurations: config)
            let repository = TaskRepositoryImpl(modelContainer: container)
            let viewModel = ToDoListViewModel(repository: repository)
            setup(for: viewModel)
            return viewModel
        } catch {
            fatalError("Failed to create preview ModelContainer")
        }
    }

    private static func setup(for viewModel: ToDoListViewModel) {
        for task in TaskEntity.mocks {
            let title = task.title
            let aboutTitle = task.aboutTitle
            viewModel.create(title: title, aboutTitle: aboutTitle)
        }
    }
}
