import SwiftUI

struct ButtonView: View {
    let titleButton: String
    let performViewModel: () -> Void
    
    var body: some View {
        Button(titleButton) {
            performViewModel()
        }
        .padding()
        .buttonStyle(.borderedProminent)
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

#Preview {
    ButtonView(titleButton: "Test") {
        print("Test button tapped")
    }
}
