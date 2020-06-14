func topKFrequent(_ words: [String], _ k: Int) -> [String] {
    var dict = [String: Int]()
    var keys = [String]()
    
    //create frequency dictionary
    for word in words {
        dict[word] = dict[word, default: 0] + 1
        if keys.contains(word) {
            continue
        } else {
            keys.append(word)
        }
        
    }
    
    
    //sorting time
    
    for i in 1..<keys.count {
        var j = i
        let tempKey = keys[j]
        let temp = dict[tempKey, default: -1]
        while j > 0 && (temp > dict[keys[j-1], default: -1] || (
        temp == dict[keys[j-1], default: -1] && tempKey.lexicographicallyPrecedes(keys[j-1]))) {
            keys[j] = keys[j-1]
            j -= 1
        }
        
        keys[j] = tempKey
    
    }
    return Array(keys[0..<k])
}
