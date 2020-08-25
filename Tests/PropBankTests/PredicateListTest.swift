import XCTest
@testable import PropBank

final class PredicateListTest: XCTestCase {
    var predicateList : PredicateList = PredicateList()

    override func setUp(){
        self.predicateList = PredicateList()
    }

    func testPredicateSize(){
        XCTAssertEqual(8656, self.predicateList.size())
    }

    func testRoleSetSize(){
        var count : Int = 0
        for lemma in self.predicateList.getLemmaList(){
            count += self.predicateList.getPredicate(lemma: lemma).size()
        }
        XCTAssertEqual(10685, count)
    }

    func testRoleSize(){
        var count : Int = 0
        for lemma in self.predicateList.getLemmaList(){
            for i in 0..<self.predicateList.getPredicate(lemma: lemma).size(){
                count += self.predicateList.getPredicate(lemma: lemma).getRoleSet(index: i).size()
            }
        }
        XCTAssertEqual(27080, count)
    }

    func testFunction(){
        var functionList : [String: Int] = [:]
        for lemma in self.predicateList.getLemmaList(){
            for i in 0..<self.predicateList.getPredicate(lemma: lemma).size(){
                for j in 0..<self.predicateList.getPredicate(lemma: lemma).getRoleSet(index: i).size(){
                    let function : String = self.predicateList.getPredicate(lemma: lemma).getRoleSet(index: i).getRole(index: j).getF()
                    if functionList[function] != nil{
                        functionList[function] = functionList[function]! + 1
                    } else {
                        functionList[function] = 1
                    }
                }
            }
        }
        XCTAssertEqual(197, functionList["com"])
        XCTAssertEqual(292, functionList["ext"])
        XCTAssertEqual(580, functionList["loc"])
        XCTAssertEqual(1104, functionList["prd"])
        XCTAssertEqual(2395, functionList["gol"])
        XCTAssertEqual(19, functionList["adj"])
        XCTAssertEqual(980, functionList["dir"])
        XCTAssertEqual(118, functionList["prp"])
        XCTAssertEqual(1007, functionList["mnr"])
        XCTAssertEqual(4, functionList["rec"])
        XCTAssertEqual(679, functionList["vsp"])
        XCTAssertEqual(14, functionList["adv"])
        XCTAssertEqual(10282, functionList["ppt"])
        XCTAssertEqual(267, functionList["cau"])
        XCTAssertEqual(37, functionList["tmp"])
        XCTAssertEqual(9105, functionList["pag"])
    }

    func testN(){
        var nList : [String: Int] = [:]
        for lemma in self.predicateList.getLemmaList(){
            for i in 0..<self.predicateList.getPredicate(lemma: lemma).size(){
                for j in 0..<self.predicateList.getPredicate(lemma: lemma).getRoleSet(index: i).size(){
                    let n : String = self.predicateList.getPredicate(lemma: lemma).getRoleSet(index: i).getRole(index: j).getN()
                    if nList[n] != nil{
                        nList[n] = nList[n]! + 1
                    } else {
                        nList[n] = 1
                    }
                }
            }
        }
        XCTAssertEqual(8906, nList["0"])
        XCTAssertEqual(10375, nList["1"])
        XCTAssertEqual(5934, nList["2"])
        XCTAssertEqual(1313, nList["3"])
        XCTAssertEqual(417, nList["4"])
        XCTAssertEqual(57, nList["5"])
        XCTAssertEqual(6, nList["6"])
        XCTAssertEqual(72, nList["m"])
    }

    static var allTests = [
        ("testExample1", testPredicateSize),
        ("testExample2", testRoleSetSize),
        ("testExample3", testRoleSize),
        ("testExample4", testFunction),
        ("testExample5", testN),
    ]
}
