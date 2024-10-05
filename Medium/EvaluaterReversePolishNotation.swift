func evalRPN(_ tokens: [String]) -> Int {
    var stack = [Int]()
    
    for token in tokens {
        switch token {
        case "+":
            let b = stack.removeLast()
            let a = stack.removeLast()
            stack.append(a + b)
        case "-":
            let b = stack.removeLast()
            let a = stack.removeLast()
            stack.append(a - b)
        case "*":
            let b = stack.removeLast()
            let a = stack.removeLast()
            stack.append(a * b)
        case "/":
            let b = stack.removeLast()
            let a = stack.removeLast()
            // 注意这里的整数除法，确保向零舍入
            stack.append(a / b) // Swift中的整除默认行为为向零舍入
        default:
            // 将操作数推入栈中
            if let number = Int(token) {
                stack.append(number)
            }
        }
    }
    
    return stack.last ?? 0
}




func evalRPN(_ tokens: [String]) -> Int {
    var stack = [Int]()
    let operations: [String: (Int, Int) -> Int] = [
        "+": { $0 + $1 },
        "-": { $0 - $1 },
        "*": { $0 * $1 },
        "/": { $0 / $1 } // 注意：Swift中的整除默认向零舍入
    ]
    
    for token in tokens {
        if let operation = operations[token] {
            let b = stack.removeLast()
            let a = stack.removeLast()
            stack.append(operation(a, b))
        } else {
            if let number = Int(token) {
                stack.append(number)
            }
        }
    }
    
    return stack.last ?? 0
}