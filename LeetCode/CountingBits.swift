class Solution {
    func countBits(_ n: Int) -> [Int] {
        return (0...n).map { $0.nonzeroBitCount }
    }
}
// (0...n)闭区间生成 0 到 n 的整数
// 然后对它进行 map 操作