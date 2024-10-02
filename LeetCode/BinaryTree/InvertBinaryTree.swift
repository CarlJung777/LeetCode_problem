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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        // 如果根节点为空，直接返回空
        guard let root = root else {
            return nil
        }
        
        // 交换左右子树
        let temp = root.left
        root.left = root.right
        root.right = temp
        
        // 递归地翻转左右子树
        _ = invertTree(root.left)
        _ = invertTree(root.right)
        
        // 返回翻转后的根节点
        return root
    }
}