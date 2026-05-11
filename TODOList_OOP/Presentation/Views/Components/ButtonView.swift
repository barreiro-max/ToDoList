import SwiftUI

struct ButtonView: View {

    let titleButton: String
    let onAction: () -> Void

    init(
        _ titleButton: String,
        onAction: @escaping () -> Void
    ) {
        self.titleButton = titleButton
        self.onAction = onAction
    }

    var body: some View {
        Button(action: onAction) {
            Text(titleButton)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

#Preview {
    ButtonView("Test") {
        print("Test button tapped")
    }
}
