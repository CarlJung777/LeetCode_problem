// Lowest  Comment Ancestor（LCA 最近公共祖先）
// Depth-First Search      Binary Search Tree      Binary Tree

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

class Solulution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else { return nil }
        
        // 如果 p 和 q 的值都比当前节点的值小，继续向左子树寻找
        if p.val < root.val && q.val < root.val {
            return lowestCommonAncestor(root.left, p, q)
        }
        // 如果 p 和 q 的值都比当前节点的值大，继续向右子树寻找
        if p.val > root.val && q.val > root.val {
            return lowestCommonAncestor(root.right, p, q)
        }
        // 如果一个在左子树，一个在右子树，当前节点就是最近公共祖先
        return root
    }
}