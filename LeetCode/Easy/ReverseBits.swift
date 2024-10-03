class Solution {
    func reversBits (_ n: Int) -> Int {
        var reversed = 0
        for i in 0..<32 {
            reversed = (reversed << 1) | ((n & (1 << i)) >> i)
        }
        return reversed
    }
}

// 此算法的时间复杂度为 𝑂(1)，因为它总是对 32 位进行处理，循环次数固定为 32。
