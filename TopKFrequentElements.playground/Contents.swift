import UIKit

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    
    //silly
    if k >= nums.count {
        return nums
    }
    
    var frequencies = [Int: Int]()
    
    var greatestFrequency = 0
    //figure out how frequently each number appears and keep track of the great frequency
    for num in nums {
        frequencies[num] = frequencies[num, default: 0] + 1
        greatestFrequency = max(frequencies[num, default: 0], greatestFrequency)
    }
    
    let keys = Array(frequencies.keys)
    
    //frequencies come in between the values of 1...max
    func bucketSort(_ keys: [Int], greatest: Int, k: Int) -> [Int] {
        var bucket = Array(repeating: [Int](), count: greatest + 1) //[0...max]
        for key in keys {
            guard let bucketIndex = frequencies[key] else {continue}
            bucket[bucketIndex].append(key)

        }

        var answer = [Int]()
        answer.reserveCapacity(k)

        var i = bucket.count - 1
        while answer.count < k && i >= 0 {
            
            for key in bucket[i] {
                if answer.count >= k {break}
                answer.append(key)
                
            }
            i -= 1
        }

        return answer

    }
    
    //create sorted set
    return bucketSort(keys, greatest: greatestFrequency, k: k)
    
//    var answer = [Int]()
//    //since we know how big our answer is supposed to be
//    answer.reserveCapacity(k)
//
//    //go through dict and find keys that correspond
//    for key in keys {
//        if answerSet.contains(frequencies[key, default: -1]) {
//            answer.append(key)
//        }
//    }
}

let input = [4,1,-1,2,-1,2,3]
let k = 2
print(topKFrequent(input, k))
