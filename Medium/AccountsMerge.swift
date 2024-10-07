class Solution {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        // 用来存储每个电子邮件的父节点。初始时，每个电子邮件的父节点是它自己
        var parent = [String: String]()
        // 用来存储每个电子邮件对应的账户所有者（名字）
        var owner = [String: String]()
        // 最终用来存储每个连通分量内的所有电子邮件。
        var unions = [String: Set<String>]() 


        // 初始化每个邮箱的父节点和账户的拥有者
        for account in accounts {
            let name = account[0]
            for email in account[1...] {
                parent[email] = email
                owner[email] = name
            }
        }   

        // 并查集的查找根节点函数
        func find(_ email: String) -> String {
            if parent[email]! != email {
                parent[email] = find(parent[email]!)  // 路径压缩
            }
            return parent[email]!
        }

        // 并查集的合并函数
        func union(_ email1: String, _ email2: String) {
            let root1 = find(email1)
            let root2 = find(email2)
            if root1 != root2 {
                parent[root1] = root2
            }
        }

        // 对每个账户进行合并
        for account in accounts {
            let firstEmail = account[1]
            for email in account[2...] {
                union(firstEmail, email)
            }
        }

        // 将邮箱按照它们的根节点进行分组
        for account in accounts {
            for email in account[1...] {
                let rootEmail = find(email)
                if unions[rootEmail] == nil {
                    unions[rootEmail] = Set<String>()
                }
                unions[rootEmail]!.insert(email)
            }
        }


        var result = [[String]]()
        for (rootEmail, emails) in unions {
            var mergedAccount = [owner[rootEmail]!]
            mergedAccount.append(contentsOf: emails.sorted())
            result.append(mergedAccount)
        }

        return result
    }
}