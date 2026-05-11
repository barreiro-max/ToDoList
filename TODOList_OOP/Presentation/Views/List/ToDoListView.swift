import SwiftUI

struct ToDoListView: View {

    let viewModel: ToDoListViewModel

    var body: some View {
        if viewModel.entities.isEmpty {
            emptyContent
        } else {
            listContent
        }
    }

    private var emptyContent: some View {
        ContentUnavailableView {
            Label("No Tasks Yet", systemImage: "tray")
        } description: {
            Text("Start by adding your first task")
        } actions: {
            ShowFormButton(onCreate: viewModel.create)
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
        }
    }

    private var listContent: some View {
        List(viewModel.entities) { task in
            TaskRow(task: task)
                .listContextMenu(
                    task: task,
                    onComplete: viewModel.complete,
                    onUpdate: viewModel.update,
                    onDelete: viewModel.delete
                )
        }
    }
}

#Preview {
    NavigationStack {
        ToDoListView(viewModel: .preview)
    }
}
