class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        // 将点按距离平方排序 这是一个闭包，用于比较数组中的点
        let sortedPoints = points.sorted {
            let distance1 = $0[0] * $0[0] + $0[1] * $0[1]
            let distance2 = $1[0] * $1[0] + $1[1] * $1[1]
            return distance1 < distance2
        }
    
        // 返回前 k 个点
        return Array(sortedPoints.prefix(k))
    }
}