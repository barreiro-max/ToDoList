import SwiftUI

struct ShowTitleFormButton: View {
    @ObservedObject var viewModel: TODOListViewModel
    @ObservedObject var task: TaskEntity

    @Binding var showTitleForm: Bool
    
    var body: some View {
        Button(role: .cancel, action: {
            self.showTitleForm.toggle()
        }) {
            Label("Edit title", systemImage: "pencil")
        }
    }
}

#Preview {
    ShowTitleFormButton(viewModel: .preview, task: .mock, showTitleForm: .constant(false))
}
// Додати значки спрва від напису
  
