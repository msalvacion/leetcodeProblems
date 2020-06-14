func partitionLabels(_ S: String) -> [Int] {
    
    //input validation
    guard !S.isEmpty else {return [Int]()}
    
    //O(N) memory
    let charArray = [Character](S)
    var answer = [Int]()
    var lastSeenMap = [Character: Int]()
    
    //make dictionary of letter and last seen index O(charArray.count) time and memory
    for (idx, letter) in charArray.enumerated() {
        lastSeenMap[letter] = idx
    }
    
    //iterate through string again and find the answer
    
    //pointer for the start of our window
    var anchor = 0
    //pointer for the end of our window
    var j = 0
    for (idx, letter) in charArray.enumerated() {
        
        //move the end of the window if this letter exists past the current endpoint
        if let lastSeenIndex = lastSeenMap[letter] {
            j = max(j, lastSeenIndex)
        }
        
        //the characters up to this point don't exist past j, this is a good
        if (idx == j) {
            answer.append(j - anchor + 1)
            anchor = j + 1
        }
        
    }
    
    return answer
}

//let S = "qiejxqfnqceocmy"

//example
let S = "ababcbacadefegdehijhklij"
//single letter //1
//let S = "a"

//empty string []
//let S = ""

//same letter
//let S = "aaaaaaaaa"

//first letter
//let S = "abbbbbbb"



partitionLabels(S)
