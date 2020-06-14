import UIKit


func isAlienSorted(_ words: [String], _ order: String) -> Bool {
    
    let alienDictionary = makeAlienDictionary(order)
    
    guard words.count > 1 else {return true}
    
    var translated1 = translate(words[0], alienDictionary)
    
    for i in 1..<words.count {
        let translated2 = translate(words[i], alienDictionary)
        if translated1.lexicographicallyPrecedes(translated2) {
            translated1 = translated2
            continue
        } else {
            return false
        }
    }
    return true
}

func makeAlienDictionary(_ alienOrder: String) -> [Character: Character] {
    
    let englishOrder: [Character] = Array("abcdefghijklmnopqrstuvwxyz")
    let alienArray: [Character] = Array(alienOrder)
    
    var alienDictionary = Dictionary<Character, Character>()
    
    for i in 0..<alienArray.count {
        alienDictionary[alienArray[i]] = englishOrder[i]
    }
    
    return alienDictionary
    
}
    
func translate(_ alienWord: String, _ alienDictionary: [Character: Character]) -> String {
    
    var translated = ""
    for char in alienWord {
        if let englishChar = alienDictionary[char] {
            translated.append(englishChar)
        }
    }
    
    print("translation", alienWord, translated)
    
    return translated
}


let words = ["aaa","aaaaa","aa"]
let order = "worldabcefghijkmnpqstuvxyz"

isAlienSorted(words, order)


