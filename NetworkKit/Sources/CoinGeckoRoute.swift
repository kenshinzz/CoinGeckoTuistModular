import Foundation

public enum CoinGeckoRoute: Endpoint {
  case coins(currency: String, perPage: Int, page: Int)
  case coinDetail(id: String)
  case search(query: String)
  case marketChart(id: String, currency: String, days: Int)
  
//  public var baseURL: String {
//    "https://api.coingecko.com/api/v3"
//  }
  
  public var path: String {
    switch self {
    case .coins:
      return "/coins/markets"
    case .coinDetail(let id):
      return "/coins/\(id)"
    case .search:
      return "/search"
    case .marketChart(let id, _, _):
      return "/coins/\(id)/market_chart"
    }
  }
  
  public var method: HTTPMethod {
    .get
  }
  
  public var headers: [String : String]? { ["Content-Type": "application/json"] }
  
  public var queryItems: [URLQueryItem]? {
    switch self {
    case .coins(let currency, let perPage, let page):
      return [
        URLQueryItem(name: "vs_currency", value: currency),
        URLQueryItem(name: "per_page", value: String(perPage)),
        URLQueryItem(name: "page", value: String(page))
      ]
    case .coinDetail:
      return [
        URLQueryItem(name: "localization", value: "false"),
        URLQueryItem(name: "tickers", value: "false"),
        URLQueryItem(name: "market_data", value: "true"),
        URLQueryItem(name: "community_data", value: "false"),
        URLQueryItem(name: "developer_data", value: "false")
      ]
    case .search(let query):
      return [
        URLQueryItem(name: "query", value: query)
      ]
    case .marketChart(_, let currency, let days):
      return [
        URLQueryItem(name: "vs_currency", value: currency),
        URLQueryItem(name: "days", value: String(days))
      ]
    }
  }
}
