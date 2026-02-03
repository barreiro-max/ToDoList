import SwiftUI

struct ShowFormButton: View {
    @ObservedObject var viewModel: TODOListViewModel
    
    @State private var showForm: Bool = false
    
    var body: some View {
        LabelButtonView(symbolName: "document.badge.plus.fill") {
            self.showForm.toggle()
        }
        .sheet(isPresented: $showForm) {
            TaskForm(viewModel: viewModel)
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    ShowFormButton(viewModel: .preview)
        .scaleEffect(2)
}
