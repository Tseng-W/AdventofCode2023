import Algorithms
import Foundation

/**
 --- Day 1: Trebuchet?! ---
 Something is wrong with global snow production, and you've been selected to take a look. The Elves have even given you a map; on it, they've used stars to mark the top fifty locations that are likely to be having problems.

 You've been doing this long enough to know that to restore snow operations, you need to check all fifty stars by December 25th.

 Collect stars by solving puzzles. Two puzzles will be made available on each day in the Advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!

 You try to ask why they can't just use a weather machine ("not powerful enough") and where they're even sending you ("the sky") and why your map looks mostly blank ("you sure ask a lot of questions") and hang on did you just say the sky ("of course, where do you think snow comes from") when you realize that the Elves are already loading you into a trebuchet ("please hold still, we need to strap you in").

 As they're making the final adjustments, they discover that their calibration document (your puzzle input) has been amended by a very young Elf who was apparently just excited to show off her art skills. Consequently, the Elves are having trouble reading the values on the document.

 The newly-improved calibration document consists of lines of text; each line originally contained a specific calibration value that the Elves now need to recover. On each line, the calibration value can be found by combining the first digit and the last digit (in that order) to form a single two-digit number.

 For example:

 1abc2
 pqr3stu8vwx
 a1b2c3d4e5f
 treb7uchet
 In this example, the calibration values of these four lines are 12, 38, 15, and 77. Adding these together produces 142.

 Consider your entire calibration document. What is the sum of all of the calibration values?

 */

struct Day01: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String

    // Splits input data into its component parts and convert from string.
    var entities: [Substring] {
        return data.split(separator: "\n")
    }

    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        // Calculate the sum of the first set of input data
        let numMatrix = entities
            .map { subString -> [Int] in
                let nums: [Int?] = [
                    subString.firstNonNil(\.wholeNumberValue),
                    subString.reversed().firstNonNil(\.wholeNumberValue)
                ]
                return nums.compactMap({ $0 })
            }
        return calculateTotal(matrix: numMatrix)
    }

    // FIXME: Too low
    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        let wordDict: [Substring: Int] = [
            "zero": 0, "one": 1, "two": 2,
            "three": 3, "four": 4, "five": 5,
            "six": 6, "seven": 7, "eight":8,
            "nine": 9
        ]

        let pattern = "zero|one|two|three|four|five|six|seven|eight|nine|\\d"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])

        func transformResult(source: inout String, result: NSTextCheckingResult?) -> Int {
            guard let result,
                  let range = Range(result.range, in: source)
            else { return 0 }
            let subString = source[range]

            if let num = Int(subString) {
                source.replaceSubrange(range, with: "_")
                return num
            } else if let num = wordDict[subString] {
                source.replaceSubrange(range, with: "_")
                return num
            } else {
                return 0
            }
        }

        // Sum the maximum entries in each set of data
        let numMatrix: [[Int]] = entities
            .map { subString -> [Int] in
                var string = String(subString)
                let matched = regex.matches(in: string, range: NSRange(location: 0, length: string.utf16.count))
                let digit = transformResult(source: &string, result: matched.last)
                let tens = transformResult(source: &string, result: matched.first)
                return [tens, digit]
            }
        return calculateTotal(matrix: numMatrix)
    }

    private func calculateTotal(matrix: [[Int]]) -> Int {
        return matrix.map({ nums -> Int in
            return (nums.first ?? 0) * 10 + (nums.last ?? 0)
        }).reduce(0, +)
    }
}
