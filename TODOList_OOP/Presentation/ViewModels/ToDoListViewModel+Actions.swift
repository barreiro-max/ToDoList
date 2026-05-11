extension ToDoListViewModel {

    func update(title: String, task: TaskEntity) {
        task.title = title
        save()
        Logger.viewModel.info("Task updated: id=\(task.id), title=\(task.title)")
    }

    func complete(task: TaskEntity) {
        task.isCompleted.toggle()
        Logger.viewModel.info("Task toggled: id=\(task.id), isCompleted=\(task.isCompleted)")
    }
}
