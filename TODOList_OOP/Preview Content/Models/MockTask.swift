extension TaskEntity {

    // swiftlint:disable line_length
    @MainActor
     static let mock: TaskEntity = TaskEntity(
        title: "Вивчати SwiftUI",
        aboutTitle: "Зосередитися на вивченні конкретних аспектів: модифікатори, назви структур, які відповідають протоколу View, і т.д.",
        isCompleted: true
    )
    // swiftlint:enable line_length

     @MainActor
     static let mocks: [TaskEntity] = [
        TaskEntity(
            title: "Помити посуд",
            aboutTitle: "Ще треба купити засіб для миття посуду",
            isCompleted: false
        ),

        TaskEntity(
            title: "Вчитися",
            aboutTitle: "Треба доробити проект та після цього відпочивати",
            isCompleted: true
        ),

        TaskEntity(
            title: "Прогулятися ввечері",
            aboutTitle: "Піти у парк",
            isCompleted: false
        )
    ]
}
