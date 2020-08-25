import XCTest
@testable import PropBank

final class FramesetListTest: XCTestCase {
    var framesetList : FramesetList = FramesetList()

    override func setUp(){
        self.framesetList = FramesetList()
    }

    func testFrames(){
        XCTAssertEqual(17691, self.framesetList.size())
    }

    func testArgSize(){
        var count : Int = 0
        for i in 0..<self.framesetList.size(){
            count += self.framesetList.getFrameSet(index: i).getFramesetArguments().count
        }
        XCTAssertEqual(29759, count)
    }

    func testArgName(){
        var nameList : [String: Int] = [:]
        for i in 0..<self.framesetList.size(){
            for argument in self.framesetList.getFrameSet(index: i).getFramesetArguments(){
                if nameList[argument.getArgumentType()] != nil{
                    nameList[argument.getArgumentType()] = nameList[argument.getArgumentType()]! + 1
                } else {
                    nameList[argument.getArgumentType()] = 1
                }
            }
        }
        XCTAssertEqual(14668, nameList["ARG0"])
        XCTAssertEqual(13126, nameList["ARG1"])
        XCTAssertEqual(1886, nameList["ARG2"])
        XCTAssertEqual(78, nameList["ARG3"])
        XCTAssertEqual(1, nameList["ARG4"])
    }

    func testArgFunction(){
        var functionList : [String: Int] = [:]
        for i in 0..<self.framesetList.size(){
            for argument in self.framesetList.getFrameSet(index: i).getFramesetArguments(){
                if functionList[argument.getFunction()] != nil{
                    functionList[argument.getFunction()] = functionList[argument.getFunction()]! + 1
                } else {
                    functionList[argument.getFunction()] = 1
                }
            }
        }
        XCTAssertEqual(481, functionList["com"])
        XCTAssertEqual(14, functionList["ext"])
        XCTAssertEqual(814, functionList["loc"])
        XCTAssertEqual(198, functionList["rec"])
        XCTAssertEqual(14, functionList["pat"])
        XCTAssertEqual(10687, functionList["ppt"])
        XCTAssertEqual(605, functionList["src"])
        XCTAssertEqual(801, functionList["gol"])
        XCTAssertEqual(156, functionList["tmp"])
        XCTAssertEqual(14557, functionList["pag"])
        XCTAssertEqual(1432, functionList["dir"])
    }

    static var allTests = [
        ("testExample1", testFrames),
        ("testExample2", testArgSize),
        ("testExample3", testArgName),
        ("testExample4", testArgFunction),
    ]
}
