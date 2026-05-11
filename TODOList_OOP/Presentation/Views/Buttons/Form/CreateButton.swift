import SwiftUI

struct CreateButton: View {

    @Environment(\.dismiss) private var dismiss

    @Binding var title: String
    @Binding var aboutTitle: String

    let onCreate: (String, String) -> Void

    var body: some View {
        ButtonView("Create") {
            onCreate(title, aboutTitle)
            dismiss()
        }
        .disabled(title.isEmpty || aboutTitle.isEmpty)
    }
}

#Preview {
    CreateButton(
        title: .constant(TaskEntity.mock.title),
        aboutTitle: .constant(TaskEntity.mock.aboutTitle),
        onCreate: ToDoListViewModel.preview.create
    )
}
