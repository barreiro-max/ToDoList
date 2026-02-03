extension TaskEntity {
    static var mock: TaskEntity {
        TaskEntity(
            title: "Вивчати SwiftUI",
            infoTitle: "Зосередитися на вивченні конкретних аспектів: модифікатори, назви структур, які відповідають протоколу View, і т.д.",
            isCompleted: true
        )
    }
    
    static var mocks: [TaskEntity] {
        [
            TaskEntity(
                title: "Помити посуд",
                infoTitle: "Ще треба купити засіб для миття посуду",
                isCompleted: false
            ),
            TaskEntity(
                title: "Вчитися",
                infoTitle: "Треба доробити проект та після цього відпочивати",
                isCompleted: true
            ),
            TaskEntity(
                title: "Прогулятися ввечері",
                infoTitle: "Піти у парк",
                isCompleted: false
            ),
        ]
    }
}
