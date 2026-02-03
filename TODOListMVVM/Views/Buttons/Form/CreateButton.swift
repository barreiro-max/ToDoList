import SwiftUI

struct CreateButton: View {
    @ObservedObject var viewModel: TODOListViewModel
    
    @Environment(\.dismiss) private var dismiss

    @Binding var title: String
    @Binding var infoTitle: String

    var body: some View {
        ButtonView(titleButton: "Create") {
            viewModel.insert(
                task: TaskEntity(
                    title: title,
                    infoTitle: infoTitle
                )
            )
            dismiss()
        }
        .disabled(title.isEmpty || infoTitle.isEmpty)
    }
}

#Preview {
    CreateButton(viewModel: .preview, title:
            .constant(TaskEntity.mock.title), infoTitle:
            .constant(TaskEntity.mock.infoTitle)
    )
}
