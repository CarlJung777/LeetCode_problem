class Sloution {
    func hammingWeight(_ n: Int) -> Int {
        return String(n, radix: 2).filter{ $0 == 1 }.count
    }
}
// 使用 radix 将 n 转换为二进制字符串
// 然后用 filter 发放进行闭包操作筛选