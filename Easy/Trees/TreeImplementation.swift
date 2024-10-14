class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class BinaryTree {
    var root: TreeNode?

    func insert(_ value: Int) {
        let newNode = TreeNode(value)
        if root == nil {
            root = newNode
        } else {
            insertHelper(root, newNode)
        }
    }

    private func insertHelper(_ node: TreeNode?, _ newNode: TreeNode) {
        if let node = node {
            if newNode.val < node.val {
                if node.left == nil {
                    node.left = newNode
                } else {
                    insertHelper(node.left, newNode)
                }
            } else {
                if node.right == nil {
                    node.right = newNode
                } else {
                    insertHelper(node.right, newNode)
                }
            }
        }
    }

    func inorderTraversal(_ node: TreeNode?) {
        guard let node = node else { return }
        inorderTraversal(node.left)
        print(node.val, terminator: " ")
        inorderTraversal(node.right)
    }
}
