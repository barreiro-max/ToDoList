import SwiftUI

struct DetailView: View {

    let title: String
    @Binding var aboutTitle: String
    let createdAt: Date

    var body: some View {
        VStack(alignment: .leading) {
            textEditor
            createdAtStack
            Spacer(minLength: 0)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var textEditor: some View {
        TextEditor(text: $aboutTitle)
            .padding()
            .overlay(overlay)
            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                return if axis == .vertical {
                    length * 0.5
                } else {
                    length * 0.9
                }
            }
    }

    private var overlay: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(Color.gray, lineWidth: 2)
    }

    private var createdAtStack: some View {
        HStack(spacing: 12) {
            Label {
                Text(createdAt, style: .date)
            } icon: {
                Image(systemName: "calendar")
            }

            Label {
                Text(createdAt, style: .time)
            } icon: {
                Image(systemName: "clock")
            }
        }
        .font(.headline)
    }
}

#Preview {
    DetailView(
        title: TaskEntity.mock.title,
        aboutTitle: .constant(TaskEntity.mock.aboutTitle),
        createdAt: TaskEntity.mock.createdAt
    )
}
