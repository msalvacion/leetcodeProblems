import UIKit

func arrayPairSum(_ nums: [Int]) -> Int {
      let sorted = nums.sorted(by: <)
      
      var sum = 0
      
      for i in 0..<nums.count {
          if i % 2 == 0 {
              sum += sorted[i]
          }
      }
      
      return sum
      
  }

let nums = [1, 2, 3, 2]
