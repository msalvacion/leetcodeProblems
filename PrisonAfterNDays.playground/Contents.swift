func prisonAfterNDays(_ cells: [Int], _ N: Int) -> [Int] {
    
    
    guard N > 0 else {return cells}
    var previousState = cells
    var newState = Array(repeating: 0, count: 8)
    
    //using a dictionary to track what day
    //we saw a state
    var seenStates = [[Int]: Int]()
    seenStates[previousState] = 0
    
    for day in 1...N {
        
        //using a dictionary to detect cycles
        
        //update cell states
        for idx in 0..<previousState.count {
            
            if idx == 0 || idx == 7 {
                newState[idx] = 0
                continue
            }
            
            //if neighbors are the same, new state is occupied
            //otherwise it's vacant
            if previousState[idx - 1] == previousState[idx + 1] {
                newState[idx] = 1
            } else {
                newState[idx] = 0
            }
        }
        
        print(newState)
        
        //if we've seen this day before, we've entered a cycle
        if let daySeen = seenStates[newState] {
            let cycleLength = day - daySeen
            let daysLeft = N - day
            return prisonAfterNDays(newState, daysLeft % cycleLength)
        }
        
        seenStates[newState] = day
        previousState = newState
        
    }
    
    return newState
}

let cells = [1,1,0,1,1,0,1,1]
let n = 6

prisonAfterNDays(cells, n)
