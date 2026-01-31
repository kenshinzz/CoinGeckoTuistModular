import Foundation

public protocol Endpoint: Sendable {
  var baseURL: String { get }
  var pathPrefix: String { get }
  var path: String { get }
  var method: HTTPMethod { get }
  var headers: [String: String]? { get }
  var queryItems: [URLQueryItem]? { get }
}

extension Endpoint {
  public var baseURL: String {
    return "api.coingecko.com"
  }
  
  public var pathPrefix: String {
    return "/api/v3"
  }
}
