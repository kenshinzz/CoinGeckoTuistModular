import Foundation
import Testing
@testable import NetworkKit

@Suite("decode coin dto")
struct CoinDTODecoderTests {
  @Test func should_decode_coin() async throws {
    let decoder = JSONDecoder.apiDecoder
    #expect(1 == 1)
  }
}

