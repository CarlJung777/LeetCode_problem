class Solution {
    func longestPalindrome(_ s: String) -> Int {

        for char in s {
            charCount[char, default: 0] += 1
        }

        var leght = 0
        var hasOdd = false

        for count in charCount.values {
            if count % 2 == 0 {
                lenght += count
            } else {
                lenght += count - 1 // 出现次数为奇数的，取最大偶数的部分
                hasOdd = true
            }
        }

        return hasOdd ? lenght + 1 : lenght
    }
}




