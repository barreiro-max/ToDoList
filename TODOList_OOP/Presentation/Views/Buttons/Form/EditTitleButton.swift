import SwiftUI

struct EditTitleButton: View {

    @Environment(\.dismiss) private var dismiss

    @Binding var titleToEdit: String
    let task: TaskEntity
    let onUpdate: (String, TaskEntity) -> Void

    var body: some View {
        ButtonView("Edit") {
            onUpdate(titleToEdit, task)
            dismiss()
        }
        .disabled(titleToEdit.isEmpty)
    }
}

#Preview {
    EditTitleButton(
        titleToEdit: .constant(TaskEntity.mock.title),
        task: .mock,
        onUpdate: ToDoListViewModel.preview.update
    )
}
