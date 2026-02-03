import SwiftUI

struct TaskForm: View {
    @ObservedObject var viewModel: TODOListViewModel

    @State private var title = ""
    @State private var infoTitle = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Enter the title for task", text: $title)
                TextField("Enter the info about task", text: $infoTitle)
                CreateButton(viewModel: viewModel,
                             title: $title,
                             infoTitle: $infoTitle
                )
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
    TaskForm(viewModel: .preview)
}
