import UIKit

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    
    let ERROR = [-1, -1]
    
    guard numbers.count > 0 else {return ERROR}
    
    var leftIdx = 0
    var rightIdx = numbers.count - 1
    
    while (leftIdx < rightIdx) {
        let sum = numbers[leftIdx] + numbers[rightIdx]
        if sum == target {
            return [leftIdx + 1, rightIdx + 1]
        }
        if sum < target {
            leftIdx += 1
        } else {
            rightIdx -= 1
        }
    }
    
    return ERROR
  }

let example = [2, 7, 11, 15]
twoSum(example, 9)
