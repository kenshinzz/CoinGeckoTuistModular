import Foundation

public protocol MyCoinUseCaseProtocol {
  func execute() async throws -> [Coin]
}
