import SwiftUI

struct ShowTitleFormButton: View {

    @Binding var showEditTitleForm: Bool

    var body: some View {
        Button(role: .cancel) {
            showEditTitleForm.toggle()
        } label: {
            Label(
                "Edit title",
                systemImage: "pencil"
            )
        }
    }
}

#Preview {
    ShowTitleFormButton(showEditTitleForm: .constant(false))
}
  
