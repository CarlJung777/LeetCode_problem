class Solution {
    func remanToInt(_ s: String) -> Int {
        let romanDictionary: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        var result = 0
        var prevValue = 0
        for char in s {
            if let value = romanDictionary[char] {
                result += value
                if value > prevValue {
                    result -= 2 * prevValue
                }
                prevValue = value
            }
        }
        return result
    }
}