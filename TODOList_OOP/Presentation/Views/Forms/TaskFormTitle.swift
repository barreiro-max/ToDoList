import SwiftUI

struct TaskFormTitle: View {

    let task: TaskEntity
    let onUpdate: (String, TaskEntity) -> Void

    @State private var title: String = ""

    var body: some View {
        Form {
            editTaskTitleSection
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var editTaskTitleSection: some View {
        Section("Edit Task title") {
            titleTextField
            editTitleButton
        }
    }

    private var titleTextField: some View {
        TextField(
            "Enter new title for task",
            text: $title
        )
    }

    private var editTitleButton: some View {
        EditTitleButton(
            titleToEdit: $title,
            task: task,
            onUpdate: onUpdate
        )
    }
}

#Preview {
    Color.clear.sheet(isPresented: .constant(true)) {
        NavigationStack {
            TaskFormTitle(task: .mock) {
                ToDoListViewModel.preview.update(title: $0, task: $1)
            }
        }
    }
}
