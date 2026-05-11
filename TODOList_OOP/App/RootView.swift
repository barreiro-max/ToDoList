import SwiftUI

struct RootView: View {

    @Environment(\.scenePhase)
    private var scenePhase

    @State var viewModel: ToDoListViewModel

    var body: some View {
        NavigationStack {
            switch viewModel.state {
            case .loading:
                splashView
            case .loaded:
                contentView
            case let .error(err):
                 errorView(err: err)
            }
        }
        .onChange(of: scenePhase) { _, newPhase in
            switch newPhase {
            case .active:
                viewModel.onAppear()
            case .background, .inactive:
                viewModel.onDisappear()
            @unknown default:
                fatalError("Handle all scenePhase cases")
            }
        }
    }

    private var splashView: some View {
        VStack(spacing: 16) {
            Image(systemName: "checklist")
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal) { width, _ in
                    width * 0.3
                }

            Text("Don't forget your tasks")
                .font(.title)
                .bold()
        }
    }

    private var contentView: some View {
        ToDoListView(viewModel: viewModel)
            .navigationTitle("ToDoList")
            .navigationDestination(for: TaskEntity.self) { task in
                @Bindable var task = task

                DetailView(
                    title: task.title,
                    aboutTitle: $task.aboutTitle,
                    createdAt: task.createdAt
                )
            }
            .listToolbar(
                onRead: viewModel.read,
                onCreate: viewModel.create,
                onFilter: viewModel.filter
            )
    }

    private func errorView(err: String) -> some View {
        Text(err)
            .font(.largeTitle)
            .foregroundStyle(.red)
            .bold()
    }
}

#Preview("RootView") {
    RootView(viewModel: .preview)
}
