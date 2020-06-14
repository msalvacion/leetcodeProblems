

func optimalUtilization(a: [[Int]], b: [[Int]], target: Int) -> [[Int]] {
    
    print("test")
    guard a.count > 0 && b.count > 0 else {return [[Int]]()}
    
    var minimumDistance: Int?
    var answer = [[Int]]()
    
    let ID = 0
    let VALUE = 1
    
    for idxA in 0..<a.count {
        for idxB in 0..<b.count {
            let sum = a[idxA][VALUE] + b[idxB][VALUE]
            if sum <= target {
                let distance = target - sum
                let ids = [a[idxA][ID], b[idxB][ID]]
                
                if minimumDistance == nil {
                    answer.append(ids)
                    minimumDistance = distance
                } else {
                    if distance == minimumDistance {
                        answer.append(ids)
                    } else if distance < minimumDistance! {
                        //replace old answer with moreoptimal answer
                        answer = [ids]
                        minimumDistance = distance
                    }
                }
            }
        }
    }
    
    return answer
}

//let a = [[1, 3], [2, 5], [3, 7], [4, 10]]
//let b = [[1, 2], [2, 3], [3, 4], [4, 5]]
//let target = 10

//let a = [[1, 8], [2, 7], [3, 14]]
//let b = [[1, 5], [2, 10], [3, 14]]
//let target = 20

let a = [[1, 8], [2, 15], [3, 9]]
let b = [[1, 8], [2, 11], [3, 12]]
let target = 20

print(optimalUtilization(a: a, b: b, target: target))
