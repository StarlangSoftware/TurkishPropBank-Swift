import XCTest
@testable import PropBank

final class ArgumentTypeTest: XCTestCase {

    func testArgumentType(){
        XCTAssertEqual(ArgumentTypeStatic.getArguments(argumentsType: "arg0"), ArgumentType.ARG0)
        XCTAssertEqual(ArgumentTypeStatic.getArguments(argumentsType: "argmdis"), ArgumentType.ARGMDIS)
        XCTAssertEqual(ArgumentTypeStatic.getArguments(argumentsType: "Arg1"), ArgumentType.ARG1)
        XCTAssertEqual(ArgumentTypeStatic.getArguments(argumentsType: "Argmdir"), ArgumentType.ARGMDIR)
    }
}
