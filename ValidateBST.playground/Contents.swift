import UIKit



 public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init() { self.val = 0; self.left = nil; self.right = nil; }
      public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
      public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
          self.left = left
          self.right = right
      }
  }


func isValidBST(_ root: TreeNode?) -> Bool {
    return helper(root, nil, nil)
}

func helper(_ node: TreeNode?,_ lowerLimit: Int?,_ upperLimit: Int?) -> Bool {
    
    guard let node = node else {return true}
    
    if let lower = lowerLimit {
        if node.val <= lower {
            return false
        }
    }
    
    if let upper = upperLimit {
        if node.val >= upper {
            return false
        }
    }
    
    if (!helper(node.left, lowerLimit, node.val)) {return false}
    if (!helper(node.right, node.val, upperLimit)) {return false}
    
    return true
    
    
}

var root = TreeNode(10)
var left = TreeNode(5)
root.left = left
var right = TreeNode(15)
right.left = TreeNode(6)
right.right = TreeNode(20)
root.right = right

//[10,5,15,null,null,6,20]

isValidBST(root)

