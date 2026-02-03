import SwiftUI
import SwiftData

@main
struct TODOListApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .preferredColorScheme(.light)
        }
        .onChange(of: scenePhase) {
            switch scenePhase {
            case .background:
                print("App in background")
            case .inactive:
                print("App is not active")
            case .active:
                print("App is active")
            @unknown default:
                fatalError("Unknown scenePhase")
            }
        }
    }
}
