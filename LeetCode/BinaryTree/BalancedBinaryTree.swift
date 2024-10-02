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
    func isBalanced(_ root: TreeNode?) -> Bool {
        // 定义一个递归函数来计算高度并检查平衡性
        func checkBalance(_ node: TreeNode?) -> (isBalanced: Bool, height: Int) {
            // 空节点是平衡的，高度为0
            guard let node = node else {
                return (true, 0)
            }
            
            // 递归检查左子树
            let left = checkBalance(node.left)
            if !left.isBalanced {
                return (false, 0)
            }
            
            // 递归检查右子树
            let right = checkBalance(node.right)
            if !right.isBalanced {
                return (false, 0)
            }
            
            // 当前节点是否平衡
            let balanced = abs(left.height - right.height) <= 1
            
            // 当前节点的高度
            let height = max(left.height, right.height) + 1
            
            return (balanced, height)
        }
        
        // 只关心是否平衡的结果
        return checkBalance(root).isBalanced
    }
}