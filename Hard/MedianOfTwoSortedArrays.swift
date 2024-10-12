// array    binary search      divide and conquer(分治法)

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count
        let n = nums2.count

        // Helper function to get the k-th element in two sorted arrays
        func getKth(_ k: Int) -> Int {
            var index1 = 0
            var index2 = 0
            var k = k
            
            while true {
                // If nums1 is exhausted, return the k-th element in nums2
                if index1 == m {
                    return nums2[index2 + k - 1]
                }
                // If nums2 is exhausted, return the k-th element in nums1
                if index2 == n {
                    return nums1[index1 + k - 1]
                }
                // If k == 1, return the minimum of the first elements of both arrays
                if k == 1 {
                    return min(nums1[index1], nums2[index2])
                }

                // Binary partition step
                let half = k / 2
                let newIndex1 = min(index1 + half, m) - 1
                let newIndex2 = min(index2 + half, n) - 1
                let pivot1 = nums1[newIndex1]
                let pivot2 = nums2[newIndex2]
                
                if pivot1 <= pivot2 {
                    k -= (newIndex1 - index1 + 1)
                    index1 = newIndex1 + 1
                } else {
                    k -= (newIndex2 - index2 + 1)
                    index2 = newIndex2 + 1
                }
            }
        }

        // Find the median
        let totalLength = m + n
        if totalLength % 2 == 1 {
            // Odd total length, return the middle element
            return Double(getKth((totalLength + 1) / 2))
        } else {
            // Even total length, return the average of the two middle elements
            let first = getKth(totalLength / 2)
            let second = getKth(totalLength / 2 + 1)
            return Double(first + second) / 2.0
        }
    }
}
