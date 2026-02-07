# TODOListMVVM

A simple TODO application built with **SwiftUI**, following the **MVVM** architecture, and using **SwiftData** as the primary data storage.  

This project demonstrates a modern approach to local data persistence and reactive UI on iOS 17+.

---

## Demonstration

https://github.com/user-attachments/assets/fbf48940-5eec-4d35-844b-592d7f23d704

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

## 🧠 Architecture

The app uses **MVVM (Model–View–ViewModel)**:

- **Model** — SwiftData `@Model`
- **View** — SwiftUI Views
- **ViewModel** — `ObservableObject`  
  (with `@StateObject` / `@ObservedObject`)

This separation allows:
- easier testing
- cleaner, more maintainable code
- isolation of business logic from UI

---

## 🗄 Data Storage — SwiftData (Key Feature)

**SwiftData** is used as the main persistence layer:

- `@Model` to define entities
- `ModelContext` to perform data operations
- automatic synchronization between UI and data
- minimal boilerplate compared to Core Data

SwiftData enables:
- declarative data handling
- no manual context management
- simple CRUD operations

> SwiftData is the primary and sole storage mechanism in this application.
