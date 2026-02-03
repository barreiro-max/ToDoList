import SwiftUI

struct ShowListButton: View {
    @ObservedObject var viewModel: TODOListViewModel

    var body: some View {
        LabelButtonView(symbolName: "list.clipboard.fill"){
            viewModel.fetchAllTasks()
        }
    }
}

#Preview {
    ShowListButton(viewModel: .preview)
        .scaleEffect(2)
}
