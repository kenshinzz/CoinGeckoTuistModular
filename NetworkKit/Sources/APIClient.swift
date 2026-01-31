import Foundation
protocol APIClientProtocol: AnyObject {
  func request<T>(type: T.Type, endPoint: any Endpoint) async throws -> T where T: Decodable
}
public final class APIClient: APIClientProtocol {
  public init() {}
  public func request<T>(type: T.Type, endPoint: any Endpoint) async throws -> T where T: Decodable {
    let data: Data
    let response: URLResponse
    let commandType = "API-ERROR: \(endPoint.path)"
    
    var urlRequest: URLRequest
    do {
      urlRequest = try URLRequest(endpoint: endPoint)
    } catch {
      print("❌ FAILED TO CREATE URLRequest: \(error)")
      throw APIRequestError.badRequest(message: "Failed to create request from endpoint.")
    }
    
    NetworkLogger.log(request: urlRequest)
    
    do {
      (data, response) = try await URLSession.shared.data(for: urlRequest)
    } catch {
      print("❌ NETWORK ERROR: \(error.localizedDescription)")
      throw APIRequestError.internetError(message: "Connection Error: \(error.localizedDescription)")
    }
    
    guard let httpResponse = response as? HTTPURLResponse else {
      let errorMessage = "Invalid response from server."
      throw APIRequestError.invalidResponse(message: errorMessage)
    }
    
    NetworkLogger.log(response: httpResponse, data: data)
    
    guard 200..<300 ~= httpResponse.statusCode else {
      let res = try? JSONDecoder().decode(NetworkHandle.self, from: data)
      
      switch httpResponse.statusCode {
      case 400:
        let errorMessage = res?.body?.message ?? "Bad Request"
        throw APIRequestError.badRequest(message: errorMessage)
      case 401, 403:
        throw APIRequestError.unAuthorized
      default:
        let errorMessage = res?.body?.message ?? "An error occurred."
        throw APIRequestError.apiError(code: res?.code ?? httpResponse.statusCode, message: errorMessage)
      }
    }
    
    do {
      let decodedObject = try JSONDecoder.apiDecoder.decode(type, from: data)
      return decodedObject
    } catch let decodingError as DecodingError {
#if DEBUG
      print("❌ DECODING ERROR: \(decodingError)")
      if let bodyString = String(data: data, encoding: .utf8) {
        print("--- FAILED TO DECODE THIS ---")
        print(bodyString)
        print("-----------------------------")
      }
#endif
      throw APIRequestError.decodingError(message: "Failed to parse server response.")
    }
  }
}
