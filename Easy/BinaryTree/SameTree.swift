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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        // 如果两个节点都为 nil，则相同
        if p == nil && q == nil {
            return true
        }
        // 如果其中一个节点为 nil，则不同
        if p == nil || q == nil {
            return false
        }
        // 如果两个节点的值不同，则不同
        if p?.val != q?.val {
            return false
        }
        // 递归比较左右子树
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}