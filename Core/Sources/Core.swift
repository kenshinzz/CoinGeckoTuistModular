import Foundation

public final class Core: Sendable {
  public static let shared = Core()
  private init() {}
  
  public func initialize() {
    print("Core module initialized")
  }
}
