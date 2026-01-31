import SwiftUI
import Observation

public protocol Coordinator {
    associatedtype Route: Hashable
    var path: NavigationPath { get set }

    func push(_ route: Route)
    func pop()
    func popToRoot()
}

@MainActor
@Observable
public class BaseCoordinator<Route: Hashable>: Coordinator {
    public var path = NavigationPath()

    public init() {}

    public func push(_ route: Route) {
        path.append(route)
    }

    public func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }

    public func popToRoot() {
        path = NavigationPath()
    }
}
