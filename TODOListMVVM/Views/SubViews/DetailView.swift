import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: TODOListViewModel
    @ObservedObject var task: TaskEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Spacer().frame(height: 50)
            
            TextEditor(text: $task.infoTitle)
                .font(.title2)      
                .lineSpacing(10)
                .padding()
                .frame(width: 360, height: 400)
                .multilineTextAlignment(.leading)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                                       .stroke(Color.gray, lineWidth: 2)
                }
                .disableAutocorrection(true)
                
            Text(task.createdAt.formatted())
                .padding()
                .bold()
                .italic()
                
            Spacer()
        }
        .navigationTitle("\(task.title)")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            viewModel.save()
        }
        
    }
}
 
#Preview {
    DetailView(viewModel: .preview, task: TaskEntity.mock)
    
}
