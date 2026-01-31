import Foundation

public struct CoinDetailDTO: Decodable {
  public let apiImage: CoinImageDTO
  public let apiMarketData: CoinMarketDataDTO
  public let id: String
  public let symbol: String
  public let name: String
}

extension CoinDetailDTO {
  enum CodingKeys: String, CodingKey {
    case id, symbol, name
    case apiImage = "image"
    case apiMarketData = "marketData"
  }
}

