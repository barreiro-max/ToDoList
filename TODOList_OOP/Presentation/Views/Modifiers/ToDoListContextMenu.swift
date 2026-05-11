import SwiftUI

struct ToDoListContextMenu: ViewModifier {

    let task: TaskEntity

    let onComplete: (TaskEntity) -> Void
    let onUpdate: (String, TaskEntity) -> Void
    let onDelete: (TaskEntity) -> Void

    @State private var showDeleteDialog = false
    @State private var showEditTitleForm = false

    func body(content: Content) -> some View {
        content
            .contextMenu {
                ShowTitleFormButton(showEditTitleForm: $showEditTitleForm)
                MarkButton(task: task, onComplete: onComplete)
                DeleteButton(showDeleteDialog: $showDeleteDialog)
            }
            .sheet(isPresented: $showEditTitleForm) {
                TaskFormTitle(
                    task: task,
                    onUpdate: onUpdate
                )
                .presentationDetents([.medium])
            }
            .confirmationDialog(
                "Are you sure you want to delete this task?",
                isPresented: $showDeleteDialog,
                titleVisibility: .visible
            ) {
                Button("OK", role: .destructive) {
                    onDelete(task)
                }
            }
    }
}

extension View {

    func listContextMenu(
        task: TaskEntity,
        onComplete: @escaping (TaskEntity) -> Void,
        onUpdate: @escaping (String, TaskEntity) -> Void,
        onDelete: @escaping (TaskEntity) -> Void
    ) -> some View {
        self.modifier(
            ToDoListContextMenu(
                task: task,
                onComplete: onComplete,
                onUpdate: onUpdate,
                onDelete: onDelete
            )
        )
    }
}

#Preview {
    NavigationStack {
        List {
            TaskRow(task: .mock)
                .listContextMenu(
                    task: .mock,
                    onComplete: ToDoListViewModel.preview.complete,
                    onUpdate: ToDoListViewModel.preview.update,
                    onDelete: ToDoListViewModel.preview.delete
                )
        }
    }
}
