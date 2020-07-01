
struct ComparedStrings: Hashable, Equatable {
    
    var text1: String
    var text2: String
    
    init(_ text1: String,_ text2: String) {
        self.text1 = text1
        self.text2 = text2
    }
}

var cache = [ComparedStrings: Int]()

func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    
    guard !text1.isEmpty, !text2.isEmpty else {
        return 0
        
    }
    let comparedStrings = ComparedStrings(text1, text2)
    if let cachedSolution = cache[comparedStrings] {
        return cachedSolution
    }
    
    //case where the first letters are the same
    if text1[text1.startIndex] == text2[text2.startIndex] {
        let index1 = text1.index(after: text1.startIndex)
        let index2 = text2.index(after: text2.startIndex)
        
        guard index1 != text1.endIndex, index2 != text2.endIndex else {return 1}
        
        let substring1 = String(text1[index1..<text1.endIndex])
        let substring2 = String(text2[index2..<text2.endIndex])
        
        return 1 + longestCommonSubsequence(substring1, substring2)
    }
    
    //case where the first didn't match
    let indexSubstring1 = text1.index(after: text1.startIndex)
    
    let substring1: String
    if indexSubstring1 == text1.endIndex {
        substring1 = ""
    } else {
        substring1 = String(text1[indexSubstring1..<text1.endIndex])
    }
    
    let case1 = longestCommonSubsequence(substring1, text2)
    
    //case where we can find the first occurence of a letter in text1
    //if we do find it, that's at least 1. Then we try to see
    //if we can match the rest of the string
    var case2 = 0
    if let firstLetter = text1.first {
        if let indexOfOccurence = text2.firstIndex(of: firstLetter) {
            if let indexAfterOccurence = text2.index(indexOfOccurence, offsetBy: 1, limitedBy: text2.endIndex) {
                    let substring2 = String(text2[indexAfterOccurence..<text2.endIndex])
                    case2 = 1 + longestCommonSubsequence(substring1, substring2)
            }
            
        }
        
    }
    
    let result = max(case1, case2)
    cache[comparedStrings] = result
    
    return result
}


let string1 = "pcbmdupybalwpkbidypqbwhefijytypwdwbsharqdurkrslqlqla"

let string2 = "jodcpirubsryvudgpwncrmtypatunqpkhehuhkdmbctyxghsfktaz"

longestCommonSubsequence(string1, string2)

