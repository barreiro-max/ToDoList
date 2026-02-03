
import SwiftUI
import SwiftData

struct RootView: View {
    @StateObject var viewModel: TODOListViewModel = TODOListAppContainer.makeTODOListViewModel()
    
    var body: some View {
        NavigationStack {
            TODOListView(viewModel: viewModel)
                .navigationTitle("My TODOList")
                .listToolbar(viewModel: viewModel)
        }
        .onAppear {
            viewModel.fetchAllTasks()
        }
        .onDisappear {
            viewModel.save()
        }
    }
}

#Preview("RootView") {
    RootView(viewModel: .preview)
}

