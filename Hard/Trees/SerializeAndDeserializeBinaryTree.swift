// String   Depth-First Search    Breadth-First Search     Design   Binary Tree
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

class Codec {
    // Serialize function using preorder traversal
    func serialize(_ root: TreeNode?) -> String {
        var result = [String]()
        serializeHelper(root, &result)
        return result.joined(separator: ",")
    }
    
    private func serializeHelper(_ root: TreeNode?, _ result: inout [String]) {
        guard let root = root else {
            result.append("null")
            return
        }
        result.append("\(root.val)")
        serializeHelper(root.left, &result)
        serializeHelper(root.right, &result)
    }
    
    // Deserialize function to reconstruct the tree from the string
    func deserialize(_ data: String) -> TreeNode? {
        var values = data.split(separator: ",").map { String($0) }
        return deserializeHelper(&values)
    }
    
    private func deserializeHelper(_ values: inout [String]) -> TreeNode? {
        if values.isEmpty { return nil }
        
        let value = values.removeFirst()
        if value == "null" {
            return nil
        }
        
        let node = TreeNode(Int(value)!)
        node.left = deserializeHelper(&values)
        node.right = deserializeHelper(&values)
        
        return node
    }
}

// Test example
let codec = Codec()
let root = TreeNode(1, TreeNode(2), TreeNode(3, TreeNode(4), TreeNode(5)))
let serialized = codec.serialize(root)
print("Serialized:", serialized)
let deserialized = codec.deserialize(serialized)
print("Deserialized:", deserialized?.val ?? "nil")
