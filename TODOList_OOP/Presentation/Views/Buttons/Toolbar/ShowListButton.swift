import SwiftUI

struct ShowListButton: View {

    let onRead: () -> Void

    var body: some View {
        LabelButtonView("list.clipboard.fill") {
            onRead()
        }
        .padding()
    }
}

#Preview {
    ShowListButton(onRead: ToDoListViewModel.preview.read)
}
