import SwiftUI

struct DeleteButton: View {

    @Binding var showDeleteDialog: Bool

    var body: some View {
        Button(role: .destructive) {
            showDeleteDialog.toggle()
        } label: {
            Label(
                "Delete",
                systemImage: "trash"
            )
        }
    }
}

#Preview {
    DeleteButton(showDeleteDialog: .constant(false))
}
