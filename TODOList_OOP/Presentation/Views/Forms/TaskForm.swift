import SwiftUI

struct TaskForm: View {

    let onCreate: (String, String) -> Void

    @State private var title = ""
    @State private var aboutTitle = ""

    var body: some View {
        Form {
            createTaskSection
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var createTaskSection: some View {
        Section("Create Task") {
            titleTextField
            aboutTitleTextField
            createButton
        }
    }

    private var titleTextField: some View {
        TextField(
            "Enter the title for task",
            text: $title
        )
    }

    private var aboutTitleTextField: some View {
        TextField(
            "Enter the info about task",
            text: $aboutTitle
        )
    }

    private var createButton: some View {
        CreateButton(
            title: $title,
            aboutTitle: $aboutTitle,
            onCreate: onCreate
        )
    }
}

#Preview {
    Color.clear
        .sheet(isPresented: .constant(true)) {
            NavigationStack {
                TaskForm { title, aboutTitle in
                    ToDoListViewModel.preview.create(
                        title: title,
                        aboutTitle: aboutTitle
                    )
                }
            }
        }
}
