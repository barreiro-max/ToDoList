import SwiftUI

struct FilterUncompletedButton: View {
    @ObservedObject var viewModel: TODOListViewModel

    var body: some View {
        LabelButtonView(symbolName: "xmark.circle.fill") {
            viewModel.filter(isDone: false)
        }
    }
}

#Preview {
    FilterUncompletedButton(viewModel: .preview)
        .scaleEffect(2)

}
