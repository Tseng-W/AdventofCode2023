@testable import AdventOfCode
import XCTest

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day01Tests: XCTestCase {
    // Smoke test data provided in the challenge question
    let testDataPart1 = """
        1abc2
        pqr3stu8vwx
        a1b2c3d4e5f
        treb7uchet
        """

    func testPart1() throws {
        let challenge = Day01(data: testDataPart1)
        XCTAssertEqual(challenge.part1() as? Int, 142)
    }

    func testPart2_Single() throws {
        let challenge = Day01(data: "aaa1aaa")
        XCTAssertEqual(challenge.part2() as? Int, 1)
    }

    func testPart2_Single2() throws {
        let challenge = Day01(data: "44two1")
        XCTAssertEqual(challenge.part2() as? Int, 41)
    }

    func testPart2_both() throws {
        let testDataPart2 = """
            two1nine
            eightwothree
            abcone2threexyz
            xtwone3four
            4nineeightseven2
            zoneight234
            7pqrstsixteen
            """
        let challenge = Day01(data: testDataPart2)
        XCTAssertEqual(challenge.part2() as? Int, 281)
    }

    func testPart2_partOf() throws {
        let testDataPart2 = """
            86jptqljgcrtrzjg7
            ndxxntxz9fivefnzdxjbz49gtfivenstgqbn
            rpcfkdzlbnkvdc8
            sevenkbslmkmfivekccclm929
            378zrrcfrsrzpgfkdjbmsix8
            19dtrqvzfqm5two
            drlpsxbscldfhj48mpxzz
            sggmjfqffmtwo5nineone
            1kfsttv
            one9sqntcvldnvtrjrp1
            hmx6mkxkxbp4oneightxgd
            onethree845n3htlxkj
            rqmnxsdnfeight2khvfivelzpsxpsevenqddk
            dtrgs7onefive43
            seven6onehvnsnlfbhbfourgcf
            bvzqgvhzgl54
            dshsqgmb9nine4five8
            """
        let challenge = Day01(data: testDataPart2)
        XCTAssertEqual(challenge.part2() as? Int, 860)
    }
}
