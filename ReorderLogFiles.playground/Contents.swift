import UIKit

func reorderLogFiles(_ logs: [String]) -> [String] {
    var digLogs = [String]()
    var letLogs = [String]()
    let delimiter: Character = " "
    
    func sortLetLogs(log: String, letLogs: inout [String]) {
    
        let substringToInsert = log.getSubstringStartingAtDelimiter(delimiter: delimiter)
        for (idx, sortedLog) in letLogs.enumerated() {
            let substringToCompare = sortedLog.getSubstringStartingAtDelimiter(delimiter: delimiter)
            
            //tie breaker
            if substringToCompare == substringToInsert {
                let toInsertId = log.getSubstringUptoDelimiter(delimiter: delimiter)
                let toCompareId = sortedLog.getSubstringUptoDelimiter(delimiter: delimiter)
                if toInsertId.lexicographicallyPrecedes(toCompareId) {
                    letLogs.insert(log, at: idx)
                    return
                }
            }
            
            if substringToInsert.lexicographicallyPrecedes(substringToCompare) {
                letLogs.insert(log, at: idx)
                return
            }
        }
        //the log should be at the end, so let's put it at the end
        letLogs.append(log)
        
    }
    
    for log in logs {
        
        let substring = log.getSubstringStartingAtDelimiter(delimiter: delimiter).dropFirst()
        if substring.first?.isNumber == true {
            digLogs.append(log)
        } else {
            sortLetLogs(log: log, letLogs: &letLogs)
        }
    }
    
    return letLogs + digLogs
}

extension String {
    func getSubstringStartingAtDelimiter(delimiter: Character) -> Substring {
        let subStringIdx = self.firstIndex(of: delimiter) ?? self.endIndex
        return self.suffix(from:subStringIdx)
    }
    
    func getSubstringUptoDelimiter(delimiter: Character) -> Substring {
        let subStringIdx = self.firstIndex(of: delimiter) ?? self.endIndex
        return self.prefix(upTo: subStringIdx)
    }
}

let logs = ["dig1 8 1 5 1","let1 art can","dig2 3 6","let2 own kit dig","let3 art zero"]

let answer = reorderLogFiles(logs)
print(answer)

