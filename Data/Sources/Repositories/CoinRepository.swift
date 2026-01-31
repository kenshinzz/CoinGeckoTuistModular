import Foundation
import Domain

public final class CoinRepository: CoinRepositoryProtocol {
  public func myCoins() async throws -> [Coin] {
    return []
  }
}
