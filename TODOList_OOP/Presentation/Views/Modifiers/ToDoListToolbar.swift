import SwiftUI

struct ToDoListToolbar: ViewModifier {

    let onRead: () -> Void
    let onCreate: (String, String) -> Void
    let onFilter: (Bool) -> Void

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    ShowListButton(onRead: onRead)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    ShowFormButton(onCreate: onCreate)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    FilterTaskButton(systemName: "checkmark.circle.fill") {
                        onFilter(true)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    FilterTaskButton(systemName: "xmark.circle.fill") {
                        onFilter(false)
                    }
                }
            }
    }
}

extension View {
    func listToolbar(
        onRead: @escaping () -> Void,
        onCreate: @escaping (String, String) -> Void,
        onFilter: @escaping (Bool) -> Void
    ) -> some View {
        self.modifier(
            ToDoListToolbar(
                onRead: onRead,
                onCreate: onCreate,
                onFilter: onFilter
            )
        )
    }
}

#Preview {
    NavigationStack {
        Form { }
            .listToolbar(
                onRead: ToDoListViewModel.preview.read,
                onCreate: ToDoListViewModel.preview.create,
                onFilter: ToDoListViewModel.preview.filter
            )
    }
}
