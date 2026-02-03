import SwiftUI

struct DeleteButton: View {
    @ObservedObject var viewModel: TODOListViewModel
    @ObservedObject var task: TaskEntity
    
    @Binding var showAlert: Bool

    var body: some View {
        Button(role: .destructive, action: {
            self.showAlert.toggle()
        }) {
            Label("Delete", systemImage: "trash")
        }
    }
}

#Preview {
    DeleteButton(viewModel: .preview, task: .mock, showAlert: .constant(false))
}

// Зробити алертс (Ви точно хочете видалити \(назва задачі)
// Додати значки спрва від напису
