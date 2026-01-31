import Foundation

public protocol CoinRepositoryProtocol: Sendable {
  func myCoins() async throws -> [Coin]
}
