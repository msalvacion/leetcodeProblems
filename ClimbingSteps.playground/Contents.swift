import UIKit

func climbStairs(_ n: Int) -> Int {
    
    //input validation
    if n <= 0 {return 0}
    if n == 1 {return 1}
    if n == 2 {return 2}
  
    var oneStepBefore = 2
    var twoStepsBefore = 1
    var solution = 0
    
    for _ in 2..<n {
        solution = oneStepBefore + twoStepsBefore
        twoStepsBefore = oneStepBefore
        oneStepBefore = solution
    }
    
    
    return solution
    
    
}

climbStairs(3)


