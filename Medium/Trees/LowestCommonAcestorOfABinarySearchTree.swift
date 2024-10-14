// Lowest  Comment Ancestor（LCA 最近公共祖先）
// Depth-First Search      Binary Search Tree      Binary Tree
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var node = root 
        while node != nil {
            if node!.val == p!.val || node!.val == q!.val {
                return node
            } else if node!.val < p!.val && node!.val < q!.val {
                node = node!.right
            } else if node!.val > p!.val && node!.val > q!.val {
                node = node!.left
            } else {
                return node
            }
        }

        return node
    }
}