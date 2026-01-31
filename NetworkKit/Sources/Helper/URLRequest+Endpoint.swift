import Foundation

extension URLRequest {
  init(endpoint: any Endpoint) throws {
    var components = URLComponents()
    components.scheme = "https"
    components.host = endpoint.baseURL
    components.path = endpoint.pathPrefix + endpoint.path
    guard let url = components.url else { throw APIRequestError.badRequest(message: "Invalid URL") }
    
    self.init(url: url)
    
    self.httpMethod = endpoint.method.rawValue
    
    endpoint.headers?.forEach { key, value in
      self.setValue(value, forHTTPHeaderField: key)
    }
    
    endpoint.headers?.forEach { key, value in
      self.setValue(value, forHTTPHeaderField: key)
    }
    
    components.queryItems = endpoint.queryItems
    self.url = components.url
  }
}
