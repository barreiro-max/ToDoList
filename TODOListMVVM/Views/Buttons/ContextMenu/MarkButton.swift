import SwiftUI

struct MarkButton: View {
    @ObservedObject var viewModel: TODOListViewModel
    @ObservedObject var task: TaskEntity

    var body: some View {
        Button(role: .cancel, action: {
            viewModel.complete(task: task)
        }) {
            Label(task.isCompleted ? "Mark by uncompleted" : "Mark by completed",
                  systemImage: task.iconSymbol
            )
        }
    }
}

#Preview {
    MarkButton(viewModel: .preview, task: .mock)
        .scaleEffect(1.5)
}
