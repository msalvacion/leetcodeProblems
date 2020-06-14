import UIKit

public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
}

struct Stack<T> {
    
    private var stack: Array<T>
    init() {
        stack = [T]()
    }
    
    mutating func push(_ element: T) {
        stack.append(element)
    }
    
    mutating func pop() -> T? {
        return stack.popLast()
    }
    
    func peek() -> T? {
        return stack.last
    }
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
}

func inorderSuccessor(_ root: TreeNode?, _ p: TreeNode?) -> TreeNode? {
    
    // case 1: the target node has a right node
    
    
    if let node = p?.right {
        var left = node.left
        if left == nil {return node}
        //checking if there is another left node. If none, we've found the successor
        while left != nil {
            if left?.left == nil {
                return left
            }
            left = left?.left
        }
    }
    
    // case 2: the target node does not have a right node, so the successor is elsewhere in the tree
    
    var stack = Stack<TreeNode>()
    
    var curr = root
    while curr != nil || !stack.isEmpty {
        while curr?.left != nil {
            print("curr", curr!.val)
            stack.push(curr!)
            curr = curr?.left
        }
        
        if curr == nil {
            curr = stack.pop()
        }
        
        if let currVal = curr?.val {
            
            if currVal == p?.val {
                return stack.pop()
            }
        }
        
        curr = curr?.right
    }
    // we made it all the way through and there's no thingy
    return nil
}

var node1 = TreeNode(2)
var node2 = TreeNode(1)
var node3 = TreeNode(3)

node1.left = node2
node1.right = node3

inorderSuccessor(node1, node2)
