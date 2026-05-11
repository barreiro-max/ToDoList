import SwiftUI

struct MarkButton: View {

    let task: TaskEntity
    let onComplete: (TaskEntity) -> Void

    var body: some View {
        Button(role: .cancel) {
            onComplete(task)
        } label: {
            Label(
                task.isCompleted ? "Mark by uncompleted" : "Mark by completed",
                systemImage: task.isCompletedTaskSystemName
            )
        }
    }
}

#Preview {
    MarkButton(
        task: .mock,
        onComplete: ToDoListViewModel.preview.complete
    )
}
