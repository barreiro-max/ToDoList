import SwiftUI

struct EditTitleButton: View {
    @ObservedObject var viewModel: TODOListViewModel
    @ObservedObject var task: TaskEntity
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var title: String
    
    var body: some View {
        ButtonView(titleButton: "Edit") {
            viewModel.edit(title: title, task: task)
            dismiss()
        }
        .disabled(title.isEmpty)
    }
}

#Preview {
    EditTitleButton(viewModel: .preview, task: .mock, title: .constant(TaskEntity.mock.title))
    
    Spacer().frame(height: 50)
    
    Text(TaskEntity.mock.title)
}
