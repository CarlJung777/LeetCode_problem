class Sloution {
    func hammingWeight(_ n: Int) -> Int {
        return String(n, radix: 2).filter{ $0 == 1 }.count
    }
}
// 使用 radix 将 n 转换为二进制字符串
// 然后用 filter 发放进行闭包操作筛选



class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var count = 0
        var num = 0

        while num > 0 {
            count += num & 1
            // 按位与 操作，也就是 num 是 1 的情况下， count 才会增加， 因为 1 & 1 的结果是 1
            num >>= 1
            // 右移一位
        }
    }
}
// 使用位运算，检查每个比特位 ，按位与（&）
// 时间复杂度：O(1)，因为整数是 32 位的，我们最多循环 32 次（每次右移一位）。
// 空间复杂度：O(1)，只使用了常数的额外空间。


class Solution {
    func hammingWeight(_ n: Int) -> {
        var count = 0
        var num = 0

        while num > 0 {
            num &= (num - 1)
            count += 1
        }
        return count 
    }
}
// Brian Kernighan 算法
// 按位与运算 & （bitwise AND）



class Solution {
    func hammingWeight(_ n: Int) -> Int {
        return n.nonzeroBitCount // 使用 Swift 内置的属性
    }
}
// 使用内置函数 nonzeroBitCount