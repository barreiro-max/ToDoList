import SwiftUI

struct DismissButton: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ButtonView(titleButton: "Cancel") {
            dismiss()
        }
    }
}

#Preview {
    DismissButton()
}
