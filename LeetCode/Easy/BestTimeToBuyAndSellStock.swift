class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        var maxProfit = 0


        for price in prices {
            minPrice = min(minPrice, price)
            maxProfit = max(maxProfit, price - minPrice)
        }

        return maxProfit
    }
}

    // 定义最小值，设置为最大 （这样第一次比较，任何价格都是小的）
    // 定义最大值，设置为0 （开始利润为 0）
    // 买入  minPrice = min(minPrice, price) 找当前价格 和 minPrice 中的最小值
    // 卖出  maxProfit = max(maxProfit, price - minPrice)

    // maxProfit 每次都会尝试更新为最大值，这样遍历完数组后就可以获得最高利润

    //O(n)，其中 n 是价格数组的长度。该算法只遍历了一次价格数组，因此时间复杂度是线性的。
    //O(1)，只使用了固定数量的变量 minPrice 和 maxProfit，没有使用额外的存储空间。