func sortColors(_ nums: inout [Int]) {
    
    var buckets = Array(repeating: 0, count: 3)
    
    for value in nums {
        buckets[value] += 1
    }
    

    var sorted = [Int]()
    
    for i in 0..<buckets.count {
        while buckets[i] > 0 {
            sorted.append(i)
            buckets[i] -= 1
        }
    }
    
    nums = sorted
    
}

var nums = [1]

sortColors(&nums)
