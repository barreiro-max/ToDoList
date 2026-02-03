import SwiftUI

struct TaskRow: View {
    @ObservedObject var viewModel: TODOListViewModel
    @ObservedObject var task: TaskEntity

    var body: some View {
        NavigationLink(destination: DetailView(viewModel: viewModel, task: task)
        ) {
            task.icon
            Text(task.title)
        }
        .listContextMenu(viewModel: viewModel, task: task)
    }
}

#Preview {
    NavigationStack {
        TaskRow(viewModel: .preview, task: .mock)
    }
}
