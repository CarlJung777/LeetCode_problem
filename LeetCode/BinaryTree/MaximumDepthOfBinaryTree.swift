/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        // 如果树为空，则深度为0
        guard let root = root else {
            return 0
        }
        // 分别计算左子树和右子树的最大深度
        let leftDepth = maxDepth(root.left)
        let rightDepth = maxDepth(root.right)
        // 返回左右子树中较大的深度加上1
        return max(leftDepth, rightDepth) + 1
    }
}