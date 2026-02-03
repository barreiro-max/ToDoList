import SwiftUI

struct LabelButtonView: View {
    let symbolName: String
    let performViewModel: () -> Void
    
    var body: some View {
        Button(action:  {
            performViewModel()
        }) {
            Image(systemName: symbolName)
                .font(.title2)
        }
    }
}

#Preview {
    LabelButtonView(symbolName: "xmark.seal") {
        print("Test Label button tapped")
    }
}
