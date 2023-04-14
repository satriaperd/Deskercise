import SwiftUI

// MARK: Please use Light Mode to preview this app because I can't force turn off the dark mode

@main
struct MyApp: App {
    init() {
        UIWindow.appearance().overrideUserInterfaceStyle = .light
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
