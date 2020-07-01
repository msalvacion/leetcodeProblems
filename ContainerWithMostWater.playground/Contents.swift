func maxArea(_ height: [Int]) -> Int {
    
    //input validation...possibly unnecessary
    guard height.count >= 2 else {return -1}
    
    var startIdx = 0
    var endIdx = height.count - 1
    
    let width = abs(startIdx - endIdx)
    let height = min(height[startIdx], height[endIdx])
    var answer = areaOf(width, height)
    
    for idx in 0..<height.count {
        
        //checking if the height at this index
        //is greater than that in our current container
        if height[idx] > height[startIdx] {
            startIdx = idx
        } else if height[idx] > height[endIdx] {
            endIdx = idx
        }
        
        let width = abs(startIdx - endIdx)
        let height = min(height[startIdx], height[endIdx])
        
        let area = areaOf(width, height)
        
        answer = max(area, answer)
    }
    
    return answer
}

func areaOf(_ width: Int,_ height: Int) -> Int {
    return width * height
}
