
func kFrequentlyMentionedWords(reviews: [String], keywords: [String], k: Int) -> [String] {
    
    //input validation
    guard keywords.count > 0 else {return [String]()}
    
    //create valid character set
    let validLetters = "abcdefghijklmnopqrstuvwxyz"
    var characterSet = Set<Character>()
    for char in validLetters {
        characterSet.insert(char)
    }
    
    //create dictionary
    var frequencyMap = [String: Int]()
    for keyword in keywords {
        frequencyMap[keyword.lowercased()] = 0
    }
    
    //keeping track of the highest frequency for bucket sort
    var highestFrequency = 0
    
    //create set, gonna use the keys as my set, save O(k) memory space
    
    func countKeywords(_ review: String) {
        
        let lowercasedReview = review.lowercased()
        var foundKeywords = Set<String>()
        var word: String = ""
        
        //helper function for checking if the word is in our map and update its frequency
        func compare(_ word: String) {
            guard let frequency = frequencyMap[word] else {return}
            
            if !foundKeywords.contains(word) {
                frequencyMap[word] = frequency + 1
                highestFrequency = max(highestFrequency, frequency + 1)
                foundKeywords.insert(word)
            }
        }
        
        for character in lowercasedReview {
            if characterSet.contains(character) {
                word.append(character)
            } else {
                if word != "" {
                    compare(word)
                }
                word = "" //reset
            }
        }
        
        //in case the whole review is just one long word
        
        compare(word)
        
    
    }
    //count occurrences in each review
    
    for review in reviews {
        countKeywords(review)
    }
    //sort occurrences by bucket sort
    
    var buckets = Array(repeating: [String](), count: highestFrequency + 1)
    
    for keyword in keywords {
        guard let bucketIndex = frequencyMap[keyword.lowercased()] else {continue}
        buckets[bucketIndex].append(keyword)
    }
    
    var idx = buckets.count - 1
    var answer = [String]()
    answer.reserveCapacity(k)
    
    while idx >= 0 && answer.count < k {
        buckets[idx].sort() //sort the bucket we're interested in. The default sort is alphabetical
        for word in buckets[idx] {
            if answer.count == k {
                break
            }
            answer.append(word)
        }
        
        idx -= 1
    }
    
    return answer
    
    //return k elements
}

let reviews = [
"I love anacell Best services; Best services provided by anacell",
"betacellular has great services",
"deltacellular provides much better services than betacellular",
"cetracular is worse than anacell",
"Betacellular is better than deltacellular, anacell."]
let keywords = ["anacell", "betacellular", "cetracular", "deltacellular", "eurocell"]
let k = 2

print(kFrequentlyMentionedWords(reviews: reviews, keywords: keywords, k: k))


