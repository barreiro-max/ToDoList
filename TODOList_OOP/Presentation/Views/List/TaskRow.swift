import SwiftUI

struct TaskRow: View {

    let task: TaskEntity

    var body: some View {
        NavigationLink(value: task) {
            isCompletedTaskimage
            Text(task.title)
        }
    }

    private var isCompletedTaskimage: some View {
        Image(systemName: task.isCompletedTaskSystemName)
            .foregroundStyle(task.isCompleted ? .green : .red)
    }
}

#Preview {
    NavigationStack {
        List {
            TaskRow(task: .mock)
            TaskRow(task: .mock)
            TaskRow(task: .mock)
            TaskRow(task: .mock)
            TaskRow(task: .mock)
        }
    }
}
