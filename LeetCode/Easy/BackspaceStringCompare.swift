class Sloution {
    func bakcspaceCompare(_ s: String, _t: String) -> Bool {
        func typed(_ str: String) -> String {
            var stack = [Character]()
            for char in str {
                if char == "#" {
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                } else {
                    stack.append(char)
                }
            }
            return stack
        }
        return typed(s) == typed(t)
    }
}
// 栈模拟