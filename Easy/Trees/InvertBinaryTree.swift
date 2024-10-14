// Binary Tree     Depth-First Search  Breadth-First Search 

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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }  // 如果根节点为空，直接返回nil
        
        // 递归交换左右子树
        let left = invertTree(root.left)
        let right = invertTree(root.right)
        
        // 交换当前节点的左右子树
        root.left = right
        root.right = left
        
        return root
    }
}


// Helper function to print the tree (in-order traversal)
func printTree(_ root: TreeNode?) {
    guard let root = root else { return }
    printTree(root.left)
    print(root.val)
    printTree(root.right)
}

// Test case
let root = TreeNode(4, 
                    TreeNode(2, TreeNode(1), TreeNode(3)),
                    TreeNode(7, TreeNode(6), TreeNode(9)))

let solution = Solution()
let invertedRoot = solution.invertTree(root)

// Print the inverted tree
printTree(invertedRoot)
// Expected output (in-order): 9 7 6 4 3 2 1

