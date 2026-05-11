import SwiftUI

struct FilterTaskButton: View {

    let systemName: String
    let onFilter: () -> Void

    var body: some View {
        LabelButtonView(systemName) {
            onFilter()
        }
    }
}

#Preview {
    FilterTaskButton(systemName: "checkmark.circle.fill") {
        ToDoListViewModel.preview.filter(by: true)
    }

    FilterTaskButton(systemName: "xmark.circle.fill") {
        ToDoListViewModel.preview.filter(by: false)
    }
}
