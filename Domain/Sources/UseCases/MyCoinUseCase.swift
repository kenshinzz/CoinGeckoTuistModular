import Foundation

public class MyCoinUseCase: MyCoinUseCaseProtocol {
  private let repository: any CoinRepositoryProtocol
  
  public init(repository: any CoinRepositoryProtocol) {
    self.repository = repository
  }
  
  public func execute() async throws -> [Coin] {
    return try await repository.myCoins()
  }
}
