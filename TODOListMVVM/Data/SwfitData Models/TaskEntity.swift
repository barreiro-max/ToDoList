import SwiftData
import SwiftUI

@Model
class TaskEntity: Identifiable, Hashable, ObservableObject {
    @Attribute(.unique) var id: UUID
    var title: String
    var infoTitle: String
    @Attribute var isCompleted: Bool
    var createdAt: Date
    var status: Status
    
    var icon: some View {
        if isCompleted {
            Image(systemName: "checkmark.circle.fill")
                .foregroundStyle(.green)
        } else {
            Image(systemName: "xmark.circle.fill")
                .foregroundStyle(.red)
        }
    }
    
    var iconSymbol: String {
        isCompleted ? "xmark.seal" : "checkmark.seal"
    }
    
    init(
        id: UUID = UUID(),
        title: String = "New task",
        infoTitle: String = "New info",
        isCompleted: Bool = false,
        createdAt: Date = .now,
        status: Status = .uncompleted
    ) {
        self.id = id
        self.title = title
        self.infoTitle = infoTitle
        self.isCompleted = isCompleted
        self.createdAt = createdAt
        self.status = status
    }
    
    enum Status: Int, Codable, Identifiable, CaseIterable {
        case completed, uncompleted
        
        var id: Self {
            self
        }
        
        var description: String {
            switch self {
            case .completed:
                "Task completed"
            case .uncompleted:
                "Task uncompleted"
            }
        }
    }
}

