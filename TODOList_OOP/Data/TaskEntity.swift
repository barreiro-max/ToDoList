import Foundation
import SwiftData

@Model
final class TaskEntity {

    @Attribute(.unique)
    var id: UUID

    var title: String
    var aboutTitle: String
    var isCompleted: Bool
    var createdAt: Date

    var isCompletedTaskSystemName: String {
        isCompleted ? "checkmark.circle.fill" : "xmark.circle.fill"
    }
    
    init(
        id: UUID = UUID(),
        title: String = "",
        aboutTitle: String = "",
        isCompleted: Bool = false,
        createdAt: Date = .now
    ) {
        self.id = id
        self.title = title
        self.aboutTitle = aboutTitle
        self.isCompleted = isCompleted
        self.createdAt = createdAt
    }
}
