// Depth-First Search    Breadth-First Search     Binary Tree
// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func goodNodes(_ root: TreeNode?) -> Int {
        // 递归函数，判断每个节点是否是好节点
        func dfs(_ node: TreeNode?, _ maxSoFar: Int) -> Int {
            guard let node = node else { return 0 }
            
            // 判断当前节点是否是好节点
            var goodCount = 0
            if node.val >= maxSoFar {
                goodCount = 1
            }
            
            // 更新路径上的最大值
            let newMax = max(maxSoFar, node.val)
            
            // 递归计算左子树和右子树的好节点数量
            goodCount += dfs(node.left, newMax)
            goodCount += dfs(node.right, newMax)
            
            return goodCount
        }
        
        // 从根节点开始，初始最大值为根节点值
        return dfs(root, root?.val ?? Int.min)
    }
}
