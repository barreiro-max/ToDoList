import SwiftUI

struct TODOListToolbar: ViewModifier {
    @ObservedObject var viewModel: TODOListViewModel

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ShowFormButton(viewModel: viewModel)
                }
                ToolbarItem(placement: .topBarLeading) {
                    ShowListButton(viewModel: viewModel)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    FilterCompletedButton(viewModel: viewModel)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    FilterUncompletedButton(viewModel: viewModel)
                }
            }
    }
}

extension View {
    func listToolbar(viewModel: TODOListViewModel) -> some View {
        self.modifier(TODOListToolbar(viewModel: viewModel))
    }
}

#Preview {
    NavigationStack {
        List {}.listToolbar(viewModel: .preview)
    }
}
