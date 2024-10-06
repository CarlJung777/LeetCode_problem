class MinStack {
    private var stack: [Int] = []
    private var minStack: [Int] = []

    /** Initialize your data structure here. */
    init() {}

    /** Push the element val onto the stack. */
    func push(_ val: Int) {
        stack.append(val)
        
        // If minStack is empty or the new value is smaller or equal to the current minimum,
        // push it onto the minStack
        if minStack.isEmpty || val <= minStack.last! {
            minStack.append(val)
        }
    }

    /** Removes the element on the top of the stack. */
    func pop() {
        // If the top element is the current minimum, pop it from minStack as well
        if let topValue = stack.last {
            if topValue == minStack.last {
                minStack.removeLast()
            }
        }
        stack.removeLast()
    }

    /** Get the top element. */
    func top() -> Int {
        return stack.last!
    }

    /** Retrieve the minimum element in the stack. */
    func getMin() -> Int {
        return minStack.last!
    }
}

