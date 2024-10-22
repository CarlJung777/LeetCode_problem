//   Trie      Hash Table     String     Design
class TrieNode {
    var children: [TrieNode?]
    var isEnd: Bool
    
    init() {
        self.children = Array(repeating: nil, count: 26)
        self.isEnd = false
    }
}

class Trie {

    private let root: TrieNode
    
    /** Initialize your data structure here. */
    init() {
        self.root = TrieNode()
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var node = root
        for char in word {
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
            if node.children[index] == nil {
                node.children[index] = TrieNode()
            }
            node = node.children[index]!
        }
        node.isEnd = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var node = root
        for char in word {
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
            if node.children[index] == nil {
                return false
            }
            node = node.children[index]!
        }
        return node.isEnd
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var node = root
        for char in prefix {
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
            if node.children[index] == nil {
                return false
            }
            node = node.children[index]!
        }
        return true
    }
}
 