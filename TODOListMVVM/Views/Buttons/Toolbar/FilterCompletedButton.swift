import SwiftUI

struct FilterCompletedButton: View {
    @ObservedObject var viewModel: TODOListViewModel

    var body: some View {
        LabelButtonView(symbolName: "checkmark.circle.fill") {
            viewModel.filter(isDone: true)
        }
    }
}

#Preview {
    FilterCompletedButton(viewModel: .preview)
        .scaleEffect(2)
}
