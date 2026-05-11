import SwiftUI

struct ShowFormButton: View {

    let onCreate: (String, String) -> Void

    @State private var showForm: Bool = false
    
    var body: some View {
        LabelButtonView("document.badge.plus.fill") {
            showForm.toggle()
        }
        .sheet(isPresented: $showForm) {
            TaskForm(onCreate: onCreate)
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    ShowFormButton(onCreate: ToDoListViewModel.preview.create)
}
