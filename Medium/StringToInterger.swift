class Solution {
    func myAtoi(_ s: String) -> Int {
        var result = 0
        var sign = 1
        var foundSign = false
        var foundDigit = false

        for char in s {
            if char == " " && !(foundSign || foundDigit) {
                continue // Ignore leading whitespace
            }

            if char == "-" && !foundSign && !foundDigit {
                sign = -1
                foundSign = true
                continue
            }

            if char == "+" && !foundSign && !foundDigit {
                foundSign = true
                continue
            }

            if let digit = char.wholeNumberValue {
                foundDigit = true

                // result * 10 表示将之前的结果向左移动一位（十倍）
                // 如果当前 result 是 4，而我们找到的 digit 是 2，那么新的 result 将变为 42。
                result = result * 10 + digit
                if result * sign > Int32.max {
                    return Int(Int32.max)
                }
                if result * sign < Int32.min {
                    return Int(Int32.min)
                }
            } else {
                break // Stop when non-digit character is encountered
            }
        }

        return result * sign
    }
}