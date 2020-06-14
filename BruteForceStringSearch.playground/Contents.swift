
var search_string = "aaaaaaaaaaaaaaAaaaaaaaaapple"
var pattern = "apple!"

extension String {
    func index(of pattern: String) -> String.Index? {
        let patternLength = pattern.count
        
        guard patternLength > 0 && patternLength <= count else {return nil}
        
        //we want to check the first full length of the pattern.
        //the guard statement guarantees that we're < endIndex
        var i = index(startIndex, offsetBy: patternLength - 1)
        
        //the index of the last character in the pattern
        var j = pattern.index(before: pattern.endIndex)
        
        //the last character in our pattern
        let lastChar = pattern.last
        
        func compareBackwards() -> String.Index? {
            //pointers
            var m = i
            var n = j
            
            while n > pattern.startIndex {
                
                if self[m] != pattern[n] {
                    return nil
                }
                
                
                m = index(before: m)
                n = pattern.index(before: n)
            }
            
            //we made it all the way through, therefore pattern matched the string
            return m
        }
        
        //iterate through our search string
        while i < endIndex {
            
            
            if self[i] == lastChar {
                if let index = compareBackwards() {
                    return index
                }
            }
            
            //either our current index didn't match the last character of pattern
            //or it did, but the pattern didn't match. We move onto the next index
            i = index(after: i)
        }
        
        return nil
    }
}

print(search_string.index(of: pattern) ?? "butts")
