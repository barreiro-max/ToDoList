import SwiftUI

struct TODOListContextMenu: ViewModifier {
    @ObservedObject var viewModel: TODOListViewModel
    @ObservedObject var task: TaskEntity
    
    @State private var showAlert = false
    @State private var showTitleForm = false
    
    func body(content: Content) -> some View {
        content
            .contextMenu {
                ShowTitleFormButton(viewModel: viewModel, task: task, showTitleForm: $showTitleForm)
                MarkButton(viewModel: viewModel, task: task)
                DeleteButton(viewModel: viewModel, task: task, showAlert: $showAlert)
            }
            .sheet(isPresented: $showTitleForm) {
                TaskFormTitle(viewModel: viewModel, task: task)
                    .presentationDetents([.medium])
            }
            .alert("Are you sure you want to delete this task?", isPresented: $showAlert) {
                Button("OK", role: .destructive) {
                    viewModel.delete(task: task)
                }
                Button("Cancel", role: .cancel) { }
            }
    }
}

extension View {
    func listContextMenu(
        viewModel: TODOListViewModel,
        task: TaskEntity) -> some View
    {
        self.modifier(TODOListContextMenu(
            viewModel: viewModel,
            task: task)
        )
    }
}


#Preview {
    NavigationStack {
        TaskRow(viewModel: .preview, task: .mock)
            .listContextMenu(viewModel: .preview, task: .mock)
    }
}
