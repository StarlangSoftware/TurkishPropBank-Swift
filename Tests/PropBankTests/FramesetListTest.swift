import XCTest
@testable import PropBank

final class FramesetListTest: XCTestCase {
    var framesetList : FramesetList = FramesetList()

    override func setUp(){
        self.framesetList = FramesetList()
    }

    func testFrames(){
        XCTAssertEqual(17531, self.framesetList.size())
    }

    func testArgSize(){
        var count : Int = 0
        for i in 0..<self.framesetList.size(){
            count += self.framesetList.getFrameSet(index: i).getFramesetArguments().count
        }
        XCTAssertEqual(29473, count)
    }

    func testCase(){
        var caseList : [String: Int] = [:]
        for i in 0..<self.framesetList.size(){
            for argument in self.framesetList.getFrameSet(index: i).getFramesetArguments(){
                if argument.getGrammaticalCase().contains("abl"){
                    if caseList["abl"] != nil{
                        caseList["abl"] = caseList["abl"]! + 1
                    } else {
                        caseList["abl"] = 1
                    }
                }
                if argument.getGrammaticalCase().contains("acc"){
                    if caseList["acc"] != nil{
                        caseList["acc"] = caseList["acc"]! + 1
                    } else {
                        caseList["acc"] = 1
                    }
                }
                if argument.getGrammaticalCase().contains("dat"){
                    if caseList["dat"] != nil{
                        caseList["dat"] = caseList["dat"]! + 1
                    } else {
                        caseList["dat"] = 1
                    }
                }
                if argument.getGrammaticalCase().contains("gen"){
                    if caseList["gen"] != nil{
                        caseList["gen"] = caseList["gen"]! + 1
                    } else {
                        caseList["gen"] = 1
                    }
                }
                if argument.getGrammaticalCase().contains("ins"){
                    if caseList["ins"] != nil{
                        caseList["ins"] = caseList["ins"]! + 1
                    } else {
                        caseList["ins"] = 1
                    }
                }
                if argument.getGrammaticalCase().contains("loc"){
                    if caseList["loc"] != nil{
                        caseList["loc"] = caseList["loc"]! + 1
                    } else {
                        caseList["loc"] = 1
                    }
                }
                if argument.getGrammaticalCase().contains("nom"){
                    if caseList["nom"] != nil{
                        caseList["nom"] = caseList["nom"]! + 1
                    } else {
                        caseList["nom"] = 1
                    }
                }
            }
        }
        XCTAssertEqual(418, caseList["abl"])
        XCTAssertEqual(4633, caseList["acc"])
        XCTAssertEqual(2402, caseList["dat"])
        XCTAssertEqual(870, caseList["gen"])
        XCTAssertEqual(451, caseList["ins"])
        XCTAssertEqual(666, caseList["loc"])
        XCTAssertEqual(2049, caseList["nom"])
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
        XCTAssertEqual(14535, nameList["ARG0"])
        XCTAssertEqual(12996, nameList["ARG1"])
        XCTAssertEqual(1865, nameList["ARG2"])
        XCTAssertEqual(76, nameList["ARG3"])
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
        XCTAssertEqual(475, functionList["com"])
        XCTAssertEqual(14, functionList["ext"])
        XCTAssertEqual(808, functionList["loc"])
        XCTAssertEqual(195, functionList["rec"])
        XCTAssertEqual(13, functionList["pat"])
        XCTAssertEqual(10579, functionList["ppt"])
        XCTAssertEqual(597, functionList["src"])
        XCTAssertEqual(794, functionList["gol"])
        XCTAssertEqual(156, functionList["tmp"])
        XCTAssertEqual(14425, functionList["pag"])
        XCTAssertEqual(1417, functionList["dir"])
    }

    static var allTests = [
        ("testExample1", testFrames),
        ("testExample2", testArgSize),
        ("testExample3", testArgName),
        ("testExample4", testArgFunction),
    ]
}
