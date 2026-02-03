import SwiftUI

struct TaskFormTitle: View {
    @ObservedObject var viewModel: TODOListViewModel
    @ObservedObject var task: TaskEntity

    @State private var title: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Enter new title for task", text: $title)
                EditTitleButton(viewModel: viewModel, task: task, title: $title)
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    DismissButton()
                }
            }
        }
    }
}

#Preview {
    TaskFormTitle(viewModel: .preview, task: TaskEntity())
}
