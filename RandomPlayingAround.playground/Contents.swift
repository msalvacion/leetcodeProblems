import UIKit

func test(_ variable: String) {
    print(variable)
    
    print(type(of: variable))
    var variable = Array(variable)
    
    print(type(of: variable))
    for i in 0..<variable.count {
        print(variable[i])
    }
}

test("myButt")
