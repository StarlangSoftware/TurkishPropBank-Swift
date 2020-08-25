import XCTest
@testable import PropBank

final class PropBankTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(PropBank().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
