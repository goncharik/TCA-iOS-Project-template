import App
import ComposableArchitecture
import SwiftUI
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    let store = Store(initialState: AppFeature.State()) {
        AppFeature()
        //            ._printChanges()
    }

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        store.send(.appDelegate(.didFinishLaunching))

        return true
    }

    func application(_: UIApplication, open url: URL, options _: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        // Handle other custom URL types.
        store.send(.appDelegate(.openUrl(url)))

        // If not handled by this app, return false.
        return false
    }
}

@main
struct TemplateApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            AppView(store: appDelegate.store)
                .onOpenURL(perform: { url in
                    _ = appDelegate.application(UIApplication.shared, open: url, options: [:])
                })
        }
    }
}
