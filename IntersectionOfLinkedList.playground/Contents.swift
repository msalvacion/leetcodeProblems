import UIKit


 public class ListNode {
      public var val: Int
      public var next: ListNode?
     public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        
        var currA = headA
        var currB = headB
        
        var distanceToTailA = 0
        var distanceToTailB = 0
        
        var answer: ListNode?
        
        //get the tails
        while currA?.next != nil {
            distanceToTailA += 1
            currA = currA?.next
        }
        while currB?.next != nil {
            distanceToTailB += 1
            currB = currB?.next
        }
        
        var prevA: ListNode?
        var prevB: ListNode?
        
        if distanceToTailA < distanceToTailB {
            currB = getIndex(headB, (distanceToTailB - distanceToTailA))
            prevB = getIndex(headB, (distanceToTailB - distanceToTailA) - 1)
            currA = headA
        } else {
            currA = getIndex(headA, distanceToTailA - distanceToTailB)
            prevA = getIndex(headA, (distanceToTailA - distanceToTailB) - 1)
            currB = headB
        }
        
        while currA != nil && currB != nil {
            if prevA == prevB && currA == currB && currA?.next == currB?.next {
                return currA
            }
            
            prevA = currA
            prevB = currB
            currA = currA?.next
            currB = currB?.next
        }
        
        return nil

    }
    
    func getIndex(_ head: ListNode?,_ atIndex: Int) -> ListNode? {
        
        guard atIndex >= 0 else {return nil}
        
        var curr = head
        var index = 0
        
        while curr != nil && index < atIndex {
            index += 1
            curr = curr?.next
        }
        
        return curr
        
    }
}

extension ListNode: Equatable, Hashable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next?.val == rhs.next?.val
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.val)
        hasher.combine(self.next?.val)
    }
    
}

let node1 = ListNode(1)
let node8 = ListNode(8)
node1.next = node8

let diffNode1 = ListNode(1)
let diffNode8 = ListNode(8)
diffNode1.next = diffNode8

print(node1.hashValue)
print(diffNode1.hashValue)


nil === nil
