import UIKit

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    //use the value as the key, and
    var hashmap = Dictionary<Int, Int>()
    var answer = Array(repeating: -1, count: 2)
    
    for (idx, value) in nums.enumerated() {
        let complement = target - value
        guard let compIdx = hashmap[complement] else {
            hashmap[value] = idx
            continue
            
        }
        if compIdx != idx {
            answer[0] = idx
            answer[1] = compIdx
        }
    }
    
    return answer
}
