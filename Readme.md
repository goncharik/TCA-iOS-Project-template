# iOS Project Template with TCA and modularization

Welcome to the TCA iOS Project Template, an open-source project template built with a hyper-modularized architecture and leveraging [The Composable Architecture (TCA)](https://github.com/pointfreeco/swift-composable-architecture) framework. This template is designed to streamline development workflows, enhance maintainability, and promote scalability for iOS applications.

## Features

- **Hyper-Modularized Architecture:** Divide your project into small, reusable, and independently testable modules.
- **Composable Architecture:** Built on top of TCA to manage application state, side effects, and composition in a robust and predictable manner.
- **SwiftGen Integration:** Utilize [SwiftGen](https://github.com/SwiftGen/SwiftGen) for managing resources and localization strings efficiently.
- **Scalability:** Easily add features without impacting existing code.
- **Testability:** Encourages unit testing at modules levels.
- **Best Practices:** Implements industry-standard patterns and conventions for modern iOS development.

## Why Use This Template?

- **Team Collaboration:** Modularization makes it easy for teams to work on different parts of the app simultaneously.
- **Code Reusability:** Write once, reuse across multiple features or projects.
- **Improved Debugging:** Isolate bugs and issues quickly with modular boundaries.
- **Future Proof:** Stay ahead with modern Swift and iOS development trends.

## Requirements

- iOS 17.0+
- Xcode 16+
- Swift 5.9

## Getting Started

#### 1. Clone the Repository

```
git clone https://github.com/goncharik/TCA-iOS-Project-template.git
cd TCA-iOS-Project-template
```

#### 2. Install Dependencies

Ensure you have Swift Package Manager (SPM) configured in your Xcode project. The dependencies required by TCA and other libraries will automatically resolve.

#### 3. Configure Your Modules

- Open the `Template.xcodeproj` file.
- Replace placeholder modules (e.g., Details) with your own.
- Define your module boundaries in `Package.swift` for seamless dependency management.
- Configure [SwiftGen](https://github.com/SwiftGen/SwiftGen) if needed to automatically generate code for resources and localization strings by updating the `swiftgen.yml` configuration file.

#### 4. Run the App



## Contributing

We welcome contributions to improve this template! 

## License

This project is licensed under the [MIT License](./LICENSE).

## Acknowledgments

- [Point-Free](https://www.pointfree.co) for The Composable Architecture framework.
- The open-source iOS development community for inspiration and guidance.

Happy coding! If you have questions or need help, feel free to open an issue or start a discussion in the repository.

