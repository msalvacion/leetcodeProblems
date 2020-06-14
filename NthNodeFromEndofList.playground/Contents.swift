import UIKit


  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }
 

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    
    var curr = head
    var delay = n
    var delayed = head
    var myHead = head
    
    //exits the first pointer is pointing to the end,
    //and the delayed poiner is pointing to one in front
    //of the node to remove
    while curr != nil {
        if delay >= 0 {
            delay -= 1
        } else {
            delayed = delayed?.next
        }
        
        curr = curr?.next
    }
    
    if delayed === myHead {
        myHead = myHead?.next
    } else {
        delayed?.next = delayed?.next?.next
    }
    
    print(myHead?.val)
    
    return myHead
    
    
}


let node1 = ListNode(1)
let node2 = ListNode(2)
node1.next = node2

removeNthFromEnd(node1, 1)
