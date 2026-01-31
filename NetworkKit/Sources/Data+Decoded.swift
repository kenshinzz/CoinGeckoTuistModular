import Foundation

public extension Data {
  func decoded<T: Decodable>(decoder: JSONDecoder = .apiDecoder) throws -> T {
    try decoder.decode(T.self, from: self)
  }
}
