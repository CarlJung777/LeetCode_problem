class MyQueue {
    var stack1: [Int]
    var stack2: [Int]

    init() {  // swift 所有类和结构体的属性在使用前都必须初始化
        stack1 = []
        stack2 = []
    }
    
    func push(_ x: Int) {
        stack1.append(x)
    }
    
    func pop() -> Int {
        if stack2.isEmpty {
            while !stack1.isEmpty {
                stack2.append(stack1.removeLast())
            }
        }
        return stack2.removeLast()
    }
    
    func peek() -> Int {
        if stack2.isEmpty {
            while !stack1.isEmpty {
                stack2.append(stack1.removeLast())
            }
        }
        return stack2.last ?? 0
        // ?? 是 Swift 中的空合并运算符（Nil-Coalescing Operator）
        // ?? 的左边 stack2.last 为 nil （数组为空） 时，返回默认值 0
    }
    
    func empty() -> Bool {
        return stack1.isEmpty && stack2.isEmpty
    }
}
