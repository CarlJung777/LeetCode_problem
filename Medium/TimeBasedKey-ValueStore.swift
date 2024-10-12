// hash table       string      binary search      design

class TimeMap {
    // Dictionary to store the key with a list of tuples (value, timestamp)
    private var store: [String: [(String, Int)]]

    // Initialize the object
    init() {
        store = [String: [(String, Int)]]()
    }

    // Store the key with the value and timestamp
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        if store[key] == nil {
            store[key] = [(String, Int)]()
        }
        store[key]?.append((value, timestamp))
    }

    // Return the value associated with the largest timestamp_prev <= timestamp
    func get(_ key: String, _ timestamp: Int) -> String {
        guard let values = store[key] else {
            return ""
        }

        // Binary search for the correct value with timestamp <= given timestamp
        var left = 0
        var right = values.count - 1
        var result = ""

        while left <= right {
            let mid = left + (right - left) / 2
            if values[mid].1 <= timestamp {
                result = values[mid].0
                left = mid + 1  // try to find a larger timestamp
            } else {
                right = mid - 1
            }
        }
        return result
    }
}
