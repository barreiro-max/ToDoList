import SwiftUI

struct LabelButtonView: View {

    let symbolName: String
    let onAction: () -> Void

    init(
        _ symbolName: String,
        onAction: @escaping () -> Void
    ) {
        self.symbolName = symbolName
        self.onAction = onAction
    }

    var body: some View {
        Button(action: onAction) {
            Image(systemName: symbolName)
        }
    }
}

#Preview {
    LabelButtonView("xmark.seal") {
        print("Test Label button tapped")
    }
}
