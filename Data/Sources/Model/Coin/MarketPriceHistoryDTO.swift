import Foundation

public struct MarketPriceHistory: Decodable {
  public let prices: [[Decimal]]
}
