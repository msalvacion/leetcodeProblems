func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
    
    guard products.count > 0, searchWord.count > 0 else {return [[String]]()}
    
    var suggestions = Array(repeating: [String](), count: searchWord.count)
    
    //go through each letter in the search string and find the words in product that match
    
    var prefix = ""
    var index = 0
    var validSubset = products
    
    for character in searchWord {
        var newSubset = [String]()
        prefix += String(character)
        for productName in validSubset {
            if productName.starts(with: prefix) {
                newSubset.append(productName)
            }
        }
        
        guard newSubset.count > 0 else {break}
        
        //nlog(n) since it's probably a merge sort, gotta look this up
        newSubset.sort()
        
        //need to only get 3 of newSubset as my answer
        //already sorted lexicographically
        for word in newSubset {
            guard suggestions[index].count < 3 else {break}
            suggestions[index].append(word)
        }
        
        validSubset = newSubset
        index += 1
    }
    
    return suggestions
    
    
}
