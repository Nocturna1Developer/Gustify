import SwiftUI

// Main entry point for our SwiftUI application
@main
struct Nice_WeatherApp: App {
    
    // The body of the App struct is a Scene, which represents one instance of your app's user interface.
    var body: some Scene {
        // WindowGroup is a scene type that's suitable for document-based apps and apps that run on platforms like iOS and watchOS, where only one instance of the app runs at a time.
        WindowGroup {
            // ContentView is the root view for your app and is the first view to be presented to the user.
            ContentView()
        }
    }
}
