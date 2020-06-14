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
 

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    
    func helper(_ leftIdx: Int,_ rightIdx: Int) -> TreeNode? {
        print("Calling helper", leftIdx, rightIdx)
        if leftIdx == rightIdx {
            print(nums[leftIdx])
            return TreeNode(nums[leftIdx])
            
        }
        if leftIdx > rightIdx {
            print("nil for", leftIdx, rightIdx)
            return nil
        }
        
        //this is the proper way to avoid overflow
        let midIdx = leftIdx + (rightIdx - leftIdx)/2
        
        let root = TreeNode(nums[midIdx])
        
        root.left = helper(leftIdx, midIdx - 1)
        root.right = helper(midIdx + 1, rightIdx)
        
        print(root.val)
        
        return root
}
    
    guard nums.count > 0 else {return nil}
    
    return helper(0, nums.count - 1)
}

let nums = [0,1,2,3,4,5]

sortedArrayToBST(nums)
