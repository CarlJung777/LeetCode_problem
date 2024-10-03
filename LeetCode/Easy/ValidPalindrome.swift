class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let filteredString = s.lowercased().filter { $0.isLetter || $0.isNumber }
        return filteredString == String(filteredString.reversed()) 
    }
}

//将目标数组全部小写处理，然后用filter函数筛选
// $0 是 swift 闭包的简写，用于引用闭包的第一个参数
//然后将筛选完毕的字符串reverse，对比之前的值，然后直接 return 结果