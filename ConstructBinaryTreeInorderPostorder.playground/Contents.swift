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



func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    
    //pointer for the node we're evaluating
    var postorderIdx: Int
    
    //invalid inputs
    if inorder.count != postorder.count {
        return nil
    }
    
    postorderIdx = postorder.count - 1
    
    var indicesMap = Dictionary<Int, Int>()
    
    for (idx, nodeValue) in inorder.enumerated() {
        indicesMap[nodeValue] = idx
    }
    
    func helper(_ left_index: Int, _ right_index: Int) -> TreeNode? {
        
        guard left_index <= right_index else {
            return nil
        }
        
        //get the index of the postorder value we're considering
        
        let postorderVal = postorder[postorderIdx]
        
        guard let idx = indicesMap[postorderVal] else {
            return nil
        }
        
        //decrement postorder idx
        postorderIdx -= 1
        
        var root = TreeNode(postorderVal)
        
        root.right = helper(idx + 1, right_index)
        root.left = helper(left_index, idx - 1)
        
        
        return root
    
    }
    
    return helper(0, inorder.count - 1)
}


