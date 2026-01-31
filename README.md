# CryptoApp

A modern iOS cryptocurrency tracking application built with Swift 6, SwiftUI, and Clean Architecture principles. This project leverages Tuist for modular project management and follows strict concurrency practices with Swift 6 Concurrency.

## Overview

CryptoApp is designed to help users track cryptocurrency prices, manage their portfolio, and stay updated with the latest market trends. The application is built with a modular architecture that promotes separation of concerns, testability, and scalability.

## Architecture

The project follows **Clean Architecture** principles with a modular design pattern, separating concerns into distinct layers:

```
┌─────────────────────────────────────────────────────────┐
│                      Presentation                        │
│              (HomeFeature, MyCoinFeature)               │
│                   + Coordinator                          │
└─────────────────┬───────────────────────────────────────┘
                  │
┌─────────────────▼───────────────────────────────────────┐
│                       Domain                             │
│            (Entities, Use Cases, Protocols)             │
└─────────────────┬───────────────────────────────────────┘
                  │
┌─────────────────▼───────────────────────────────────────┐
│                        Data                              │
│         (Repository Implementations, DTOs)              │
└─────────────────┬───────────────────────────────────────┘
                  │
┌─────────────────▼───────────────────────────────────────┐
│                     NetworkKit                           │
│              (API Client, Networking)                   │
└─────────────────────────────────────────────────────────┘
```

### Architecture Layers

1. **Presentation Layer**: SwiftUI views and ViewModels organized as feature modules
2. **Domain Layer**: Business logic, use cases, and entity definitions
3. **Data Layer**: Repository implementations and data transformations
4. **Infrastructure Layer**: Networking, persistence, and external service integrations

## Module Structure

### Core Modules

- **App**: Main application target and entry point
- **Core**: Shared utilities, extensions, and common types used across all modules
- **DesignSystem**: UI components, theme, colors, fonts, and reusable SwiftUI views
- **Coordinator**: Navigation and routing coordination

### Business Logic Modules

- **Domain**: Business entities, use cases, and repository protocols
- **Data**: Repository implementations, DTOs, and data mapping logic
- **NetworkKit**: HTTP client, API endpoints, and network service abstractions

### Feature Modules

- **HomeFeature**: Home screen displaying cryptocurrency market overview
- **MyCoinFeature**: Personal cryptocurrency portfolio management

Each feature module is independent and can be developed, tested, and deployed separately.

## Technologies Used

- **Swift 6.0**: Latest Swift version with strict concurrency checking
- **SwiftUI**: Declarative UI framework for building native iOS interfaces
- **Swift Concurrency**: async/await, actors, and structured concurrency (NO Combine)
- **Tuist**: Project generation and modular architecture management
- **Clean Architecture**: Separation of concerns and dependency inversion
- **Protocol-Oriented Programming**: Flexible and testable code design

### Swift 6 Concurrency Features

This project leverages Swift 6's strict concurrency model:

- `SWIFT_VERSION`: 6.0
- `SWIFT_STRICT_CONCURRENCY`: complete
- Strict concurrency checking enabled
- MainActor isolation for UI components
- Actor-based state management
- No Combine framework usage

## Prerequisites

Before you begin, ensure you have the following installed:

- **Xcode 16.0+**: Required for Swift 6.0 support
- **macOS 14.0+**: Required for Xcode 16
- **Tuist**: Project generation tool

### Installing Tuist

Install Tuist using one of the following methods:

#### Using Homebrew (Recommended)

```bash
brew install tuist
```

#### Using curl

```bash
curl -Ls https://install.tuist.io | bash
```

#### Verify Installation

```bash
tuist --help
```

## Setup Instructions

Follow these steps to set up the project on your local machine:

### 1. Clone the Repository

```bash
git clone <repository-url>
cd CoinGenkoApp
```

### 2. Generate Xcode Project

Tuist generates the Xcode workspace and project files from the manifest files:

```bash
tuist install
tuist generate
```

This will:
- Resolve any external dependencies defined in `Tuist/Package.swift`
- Generate the `CryptoApp.xcworkspace` file
- Create all module projects with their dependencies

### 3. Open the Workspace

```bash
open CryptoApp.xcworkspace
```

**Important**: Always open the `.xcworkspace` file, not individual `.xcodeproj` files.

### 4. Select Build Scheme

The project includes multiple build configurations:

- **Debug-Dev**: Development environment with debug symbols
- **Debug-Staging**: Staging environment for testing
- **Release**: Production-ready optimized build

Select the `CryptoApp` scheme and your target device/simulator in Xcode.

## Building and Running

### Using Xcode

1. Open `CryptoApp.xcworkspace`
2. Select the `CryptoApp` scheme
3. Choose a simulator or connected device
4. Press `Cmd + R` to build and run

### Using Tuist CLI

Build the project from the command line:

```bash
tuist build
```

Run tests:

```bash
tuist test
```

Clean generated files:

```bash
tuist clean
```

## Project Structure

```
CoinGenkoApp/
├── App/                    # Main application target
│   ├── Project.swift       # App target configuration
│   └── Sources/            # App entry point and root views
│
├── Core/                   # Shared utilities and extensions
│   ├── Project.swift
│   └── Sources/
│
├── DesignSystem/          # UI components and theme
│   ├── Project.swift
│   └── Sources/
│
├── Coordinator/           # Navigation and routing
│   ├── Project.swift
│   └── Sources/
│
├── Domain/                # Business logic layer
│   ├── Project.swift
│   ├── Sources/           # Entities, use cases, protocols
│   └── Tests/
│
├── Data/                  # Data layer implementation
│   ├── Project.swift
│   ├── Sources/           # Repositories, DTOs
│   └── Tests/
│
├── NetworkKit/            # Networking infrastructure
│   ├── Project.swift
│   ├── Sources/           # API client, endpoints
│   └── Tests/
│
├── HomeFeature/           # Home screen feature
│   ├── Project.swift
│   ├── Sources/           # Views, ViewModels
│   └── Tests/
│
├── MyCoinFeature/         # Portfolio feature
│   ├── Project.swift
│   ├── Sources/           # Views, ViewModels
│   └── Tests/
│
├── Tuist/                 # Tuist configuration
│   ├── Package.swift      # External dependencies
│   └── ProjectDescriptionHelpers/
│       └── Project+Templates.swift  # Reusable project templates
│
├── Workspace.swift        # Workspace definition
└── README.md             # This file
```

## Build Configurations

The project supports multiple build environments:

### Dev Environment
- Bundle ID: `com.cryptoapp.dev`
- App Name: `Crypto Dev`
- Used for active development and debugging

### Staging Environment
- Bundle ID: `com.cryptoapp.staging`
- App Name: `Crypto Staging`
- Used for QA testing before production

### Production Environment
- Bundle ID: `com.cryptoapp`
- App Name: `Crypto`
- Optimized release build for App Store distribution

## Development Guidelines

### Swift Concurrency

This project uses Swift 6 Concurrency exclusively:

- Use `async/await` for asynchronous operations
- Use `Actor` for thread-safe state management
- Use `@MainActor` for UI-related code
- **DO NOT use Combine framework** - Use Swift Concurrency instead

### SwiftUI Previews

Every SwiftUI view must include previews for visual validation:

```swift
#Preview {
    ContentView()
}
```

### Testing

Each framework module includes a test target. Maintain test coverage above 80%:

```bash
tuist test
```

### Code Quality

- Follow Swift API Design Guidelines
- Use meaningful variable and function names
- Document public APIs with Swift markup
- Keep functions focused and small
- Prefer value types (structs/enums) over reference types
- Use protocol-oriented design for flexibility

## Deployment Target

- **Minimum iOS Version**: 18.0
- **Swift Version**: 6.0

## Contributing

When contributing to this project:

1. Follow the established module structure
2. Add tests for new features
3. Create SwiftUI previews for all views
4. Use Swift 6 Concurrency (async/await, actors)
5. Avoid third-party dependencies - use Apple frameworks only
6. Run `tuist generate` after modifying project structure

## Troubleshooting

### Xcode Cannot Find Module

```bash
tuist clean
tuist generate
```

### Build Errors After Pulling Changes

```bash
tuist install
tuist generate
```

### Reset Everything

```bash
rm -rf *.xcworkspace
rm -rf */*.xcodeproj
tuist clean
tuist generate
```

## License

Copyright 2026. All rights reserved.

---

Built with Swift 6, SwiftUI, and Tuist.
