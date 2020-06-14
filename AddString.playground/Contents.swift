import UIKit

func addString(_ num1: String,_ num2: String) -> String {
    
    //we're using the longer value as the container for our result
    if num1.count < num2.count {
        return addString(num2, num1)
    }
    
    var longerNumber = [Character](num1)
    var shorterNumber = [Character](num2)
    
    var i = longerNumber.count - 1
    var j = shorterNumber.count - 1
    
    var carry: UInt8 = 0
    
    // for normalizing the ascii value
    let asciiZeroValue = Character.init("0").asciiValue ?? 48 // from an ascii table
    
    while i >= 0 || j >= 0 {
        
        var sum: UInt8 = 0
        
        if i>=0 {
            guard let asciiValue = longerNumber[i].asciiValue else {continue}
            sum += asciiValue - asciiZeroValue
        }
        
        if j>=0 {
            guard let asciiValue = shorterNumber[j].asciiValue else {continue}
            sum += asciiValue - asciiZeroValue
        }
        
        sum += carry
        
        // carry is in the tens place
        carry = sum / 10
        
        // the ones digit
        sum = sum % 10
        
        //replace the digit i, with the ones place
        longerNumber[i] = Character.init("\(sum)")
        
        i -= 1
        j -= 1
    }
    
    var answer = String(longerNumber)
    if carry != 0 {
        answer = String(carry) + answer
    }
    
    return answer
    
}

var num1 = "1234"
var num2 = "9999"

addString(num1, num2)

