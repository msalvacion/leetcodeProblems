import UIKit

public class ListNode {
   public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }


func detectCycle(_ head: ListNode?) -> ListNode? {
    var set = Set<ListNode>()
    
    var node = head
    
    while let unwrappedNode = node {
                
        if set.contains(unwrappedNode) {
            return unwrappedNode
        }
        
        set.insert(unwrappedNode)
        node = unwrappedNode.next
    }
    
    return nil
}

extension ListNode: Hashable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next?.val == rhs.next?.val
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.val)
        hasher.combine(self.next?.val)
    }
}

