import XCTest
@testable import PathOfLowestCostApp

class GridTests: XCTestCase {

    func testFindLowestCostPath() {
        // Test case 1
        let grid1 = Grid([[3, 4, 1, 2, 8, 6],
                          [6, 1, 8, 2, 7, 4],
                          [5, 9, 3, 9, 9, 5],
                          [8, 4, 1, 3, 2, 6]])
        let result1 = grid1.findLowestCostPath()
        XCTAssertEqual(result1.0, true)
        XCTAssertEqual(result1.1, 16)
        XCTAssertEqual(result1.2, [1, 2, 4, 4, 4, 3])

        // Test case 2
        let grid2 = Grid([[3, 7, 2, 8, 6, 4],
                          [3, 4, 1, 2, 8, 6],
                          [6, 1, 8, 2, 7, 4],
                          [5, 9, 3, 9, 9, 5],
                          [8, 4, 1, 3, 2, 6],
                          [3, 7, 2, 1, 2, 3]])
        let result2 = grid2.findLowestCostPath()
        XCTAssertEqual(result2.0, true)
        XCTAssertEqual(result2.1, 11)
        XCTAssertEqual(result2.2, [1, 2, 1, 5, 4, 5])

        // Test case 3
        let grid3 = Grid([[19, 10, 19, 10, 19],
                          [21, 23, 20, 19, 12],
                          [20, 12, 20, 11, 10]])
        let result3 = grid3.findLowestCostPath()
        XCTAssertEqual(result3.0, false)
        XCTAssertEqual(result3.1, 48)
        XCTAssertEqual(result3.2, [1, 1, 1])
    }
}
