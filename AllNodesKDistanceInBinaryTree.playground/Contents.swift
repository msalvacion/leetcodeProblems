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



func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ K: Int) -> [Int] {
    
    let level = 0
    var targetLevel: Int?
    
    //dictionary to keep track of what values are at which level of the tree
    //keys are negative to the left of the root, positive to the right
    var levels = [Int: [Int]]()
    
    
    
    guard let root = root else {return []}
    
    //assign targetLevel if we find it
    if root.val == target?.val {
        targetLevel = level
    }
    
    levels[level] = [root.val]
    
    func bfs(_ node: TreeNode?, level: Int, isLeftSide: Bool) {
        
        guard let node = node else {return}
        
        let increment: Int
        
        if isLeftSide {
            increment = level - 1
        } else {
            increment = level + 1
        }
        
        //assign targetLevel if we find it
        if node.val == target?.val {
            targetLevel = level
        }
        
        levels[level, default: []].append(node.val)
        
        bfs(node.left, level: increment, isLeftSide: isLeftSide)
        bfs(node.right, level: increment, isLeftSide: isLeftSide)
        
    }
    
    bfs(root.left, level: -1, isLeftSide: true)
    bfs(root.right, level: 1, isLeftSide: false)
    
    //we never found the target...I was lied to
    guard let unwrappedTargetLevel = targetLevel else {return []}
    
    let rightLevel = unwrappedTargetLevel + K
    let leftLevel = unwrappedTargetLevel - K
    
    if rightLevel == leftLevel {
        return levels[leftLevel, default:[]]
    }
    
    return levels[rightLevel, default: []] + levels[leftLevel, default: []]
    
}

let node3 = TreeNode(3)
let node5 = TreeNode(5)
let node6 = TreeNode(6)
let node2 = TreeNode(2)
let node7 = TreeNode(7)
let node4 = TreeNode(4)
let node1 = TreeNode(1)
let node0 = TreeNode(0)
let node8 = TreeNode(8)

node3.left = node5
node3.right = node1
node5.left = node6
node5.right = node2
node2.left = node7
node2.right = node4
node1.left = node0
node1.right = node8

print(distanceK(node3, node2, 2))
