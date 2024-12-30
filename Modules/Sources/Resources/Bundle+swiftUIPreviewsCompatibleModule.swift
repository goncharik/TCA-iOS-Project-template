import Foundation

// MARK: - Workaround for SwiftUI Previews to work

extension Foundation.Bundle {
    static var swiftUIPreviewsCompatibleModule: Bundle {
        final class CurrentBundleFinder {}

        let packageName = "Template"
        let targetName = "Resources"

        let bundleNameIOS = "\(packageName)_\(targetName)"
        let candidates = [
            // Bundle should be here when the package is linked into an App.
            Bundle.main.resourceURL,
            // Bundle should be here when the package is linked into a framework.
            Bundle(for: CurrentBundleFinder.self).resourceURL,
            // For command-line tools.
            Bundle.main.bundleURL,
            // Bundle should be here when running previews from a different package
            // (this is the path to "…/Debug-iphonesimulator/").
            Bundle(for: CurrentBundleFinder.self)
                .resourceURL?
                .deletingLastPathComponent()
                .deletingLastPathComponent()
                .deletingLastPathComponent(),
            Bundle(for: CurrentBundleFinder.self)
                .resourceURL?
                .deletingLastPathComponent()
                .deletingLastPathComponent(),
        ]

        for candidate in candidates {
            let bundlePathiOS = candidate?.appendingPathComponent(bundleNameIOS + ".bundle")
            if let bundle = bundlePathiOS.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("Can't find myPackage custom bundle.")
    }
}

extension ImageAsset: Hashable {
    public static func == (lhs: ImageAsset, rhs: ImageAsset) -> Bool {
        lhs.name == rhs.name
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
