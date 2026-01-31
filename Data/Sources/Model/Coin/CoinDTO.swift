import Foundation
import NetworkKit

public struct CoinDTO: Decodable, Equatable {
  public let id: String
  public let symbol: String
  public let name: String
  public let image: URL
  public let currentPrice: Decimal
  public let marketCap: Decimal
  public let priceChangePercentage24H: Double
  public let marketCapChangePercentage24H: Double
}


//import Playgrounds
//#Playground {
//  let apiClient = NetworkAPI()
//  Task.detached {
//    let coins = try await apiClient.performRequest(
//      NetworkRoute.coins(currency: "usd", perPage: 20, page: 1),
//      for: [CoinDTO].self
//    )
//  }
//  
//}
