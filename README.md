# ToDoList

A modern TODO app built with SwiftUI using MVVM architecture and Repository Pattern.

The project is based on SwiftData for persistence and uses modern iOS 17+ APIs including Observation and Swift Concurrency (async/await, structured concurrency).

It focuses on clean architecture, separation of concerns, and scalable state management between UI, domain logic, and data layer.
---

## Demonstration

https://github.com/user-attachments/assets/da4fa213-8fe1-44c9-8532-e7546acd2648

---

## ✨ Features

- ➕ Create tasks
- ✏️ Edit tasks
- 🗑 Delete tasks
- ✅ Mark tasks as completed
- 📝 Add additional information/details to tasks
- 🔍 Filter tasks by:
  - All
  - Completed
  - Uncompleted

---

## 🧠 Data Flow & Architecture

The app uses **MVVM (Model–View–ViewModel)**:

SQLite via SwiftData → ModelContext → TaskRepository → ViewModel → Views

- SwiftData handles persistence in SQLite
- ModelContext performs CRUD operations
- TaskRepository wraps data access logic
- ViewModel is injected via DI and manages state and business logic
- Views only render state and trigger actions via closures and properties

## 🛠️ App setup and lifecycle

- AppContainer builds the full dependency graph
- Configures ModelContainer
- Creates TaskRepository and ViewModel

- @main creates AppContainer and injects it into RootView

- RootView stores ViewModel in @State and controls its lifecycle with onAppear and onDisappear

- UI communicates with ViewModel via properties and closures with no tight coupling

---

🗄 Data Storage — SwiftData (Key Feature)

SwiftData is used as the main persistence layer:

* `@Model` for defining persistent entities
* `@ModelActor` for safe concurrent data access
* `ModelContainer` configuration is centralized in AppContainer
* `ModelContext` is used internally for data operations

SwiftData enables:

* declarative data modeling
* thread-safe operations with actors
* clean separation between storage and business logic
* simplified CRUD without manual persistence handling

SwiftData is the primary and sole storage mechanism in this application
