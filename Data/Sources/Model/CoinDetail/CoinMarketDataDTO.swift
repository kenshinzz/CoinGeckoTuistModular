import Foundation

public struct CoinMarketDataDTO: Decodable {
  public let apiCurrentPrice: ValueDecimalDTO
  public let apiMarketCap: ValueDoubleDTO
  public let apiAth: ValueDecimalDTO
  public let apiAthChangePercentage: ValueDoubleDTO
  public let apiAtl: ValueDecimalDTO
  public let apiAtlChangePercentage: ValueDoubleDTO
  public let priceChangePercentage24H: Double
  public let marketCapChangePercentage24H: Double
}

extension CoinMarketDataDTO {
  enum CodingKeys: String, CodingKey {
    case priceChangePercentage24H, marketCapChangePercentage24H
    case apiCurrentPrice = "currentPrice"
    case apiMarketCap = "marketCap"
    case apiAth = "ath"
    case apiAthChangePercentage = "athChangePercentage"
    case apiAtl = "atl"
    case apiAtlChangePercentage = "atlChangePercentage"
  }
}

public struct ValueDecimalDTO: Decodable {
  public let usd: Decimal
}

public struct ValueDoubleDTO: Decodable {
  public let usd: Double
}
