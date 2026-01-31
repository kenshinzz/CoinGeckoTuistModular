import Foundation

public struct Coin: Identifiable, Hashable, Sendable {
    public let id: String
    public let symbol: String
    public let name: String
    public let currentPrice: Double?
    public let priceChangePercentage24h: Double?
    public let image: String?
    
    public init(
        id: String,
        symbol: String,
        name: String,
        currentPrice: Double? = nil,
        priceChangePercentage24h: Double? = nil,
        image: String? = nil
    ) {
        self.id = id
        self.symbol = symbol
        self.name = name
        self.currentPrice = currentPrice
        self.priceChangePercentage24h = priceChangePercentage24h
        self.image = image
    }
}
