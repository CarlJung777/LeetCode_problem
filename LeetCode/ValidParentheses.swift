class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []

        let mappings: [Character: Character] = [
            ")": "(",
            "]": "[",
            "}": "{"
        ]

        for char in s {

            if char == "(" || char == "[" || char == "{" {
                stack.append(char)
            } else {
                if stack.isEmpty {
                    return false
                }

                let topChar = stack.removeLast()
                let expectedChar = mappings[char]

                if topChar != expectedChar {
                    return false
                }
            }
        }

        return stack.isEmpty
    }
}