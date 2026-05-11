import SwiftUI

@main
struct TodoListApp: App {

    private let container: AppContainer

    init() {
        self.container = AppContainer()
    }

    var body: some Scene {
        WindowGroup {
            RootView(
                viewModel: container.makeToDoListViewModel()
            )
            .preferredColorScheme(.light)
        }
    }
}
