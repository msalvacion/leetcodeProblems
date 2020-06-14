import UIKit

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }


func reverseList(_ head: ListNode?) -> ListNode? {
    
    guard head?.next != nil else {return head}
    let p = reverseList(head?.next)
    head?.next?.next = head //reverse it
    head?.next = nil
    return p
    }
    
    
    
    //iterative solution
//    var newHead = head
//
//
//    while (head?.next != nil) {
//        let oldHead = newHead
//        newHead = head?.next // non nil
//        head?.next = head?.next?.next
//        newHead?.next = oldHead
//
//    }
//
//    return newHead

let node1 = ListNode(1)
let node2 = ListNode(2)
node1.next = node2

reverseList(node1)
