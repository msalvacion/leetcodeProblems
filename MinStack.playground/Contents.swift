import UIKit

class MinStack<T: Comparable> {
    
    private var _min: T?
    private var stack: Array<T>
    
    init() {
        stack = [T]()
    }
    
    func push(_ element: T) {
        stack.append(element)
        guard let unwrappedMin = _min else {
            _min = element
            return
            
        }
       _min = min(element, unwrappedMin)
        
    }
    
    func pop() -> T {
        
        let popped = stack.popLast()!
        
        //update
        if popped == _min {
            _min = stack.min()
        }
        
        return popped
        
        
    }
    
    //again, promised will always be called on a nonempty array
    func top() -> T {
        
        return stack.last!
    }
    
    //I was promised min would always be called on a nonempty array.
    func getMin() -> T {
      return _min!
    }
    
}

var stack = MinStack<Int>()

stack.push(-2)
stack.push(0)
stack.push(-3)
stack.getMin()
stack.pop()
stack.top()
stack.getMin()


