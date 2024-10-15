// Dynamic Programming     Depth-First Search   Binary Tree
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
    var maxSum = Int.min

    func maxPathSum(_ root: TreeNode?) -> Int {
        _ = maxGain(root)
        return maxSum
    }
    
    private func maxGain(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }
        
        // 计算左子树和右子树的最大贡献值
        let leftGain = max(maxGain(node.left), 0) // 如果贡献值为负，取0
        let rightGain = max(maxGain(node.right), 0) // 如果贡献值为负，取0
        
        // 当前节点的最大路径和：该节点值 + 左右子树的贡献值
        let currentPathSum = node.val + leftGain + rightGain
        
        // 更新全局最大路径和
        maxSum = max(maxSum, currentPathSum)
        
        // 返回该节点的最大贡献值：节点值 + 较大的一边的子树
        return node.val + max(leftGain, rightGain)
    }
}
