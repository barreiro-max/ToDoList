import SwiftUI

struct TODOListView: View {
    @ObservedObject var viewModel: TODOListViewModel
    
    var body: some View {
        List(viewModel.tasks) { task in
            TaskRow(viewModel: viewModel, task: task)
        }

    }
}

#Preview {
    TODOListView(viewModel: .preview)
}
