
 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    var curr1 = l1
    var curr2 = l2
    
    var tail: ListNode?
    var carry = 0
    
    while curr1 != nil && curr2 != nil {
        var newValue = curr1!.val + curr2!.val + carry
        carry = newValue > 9 ? 1 : 0
        newValue = newValue % 10
        
        let newNode = ListNode(newValue, tail)
        tail = newNode
        
        curr1 = curr1.next
        curr2 = curr2.next
    }
    
    while curr1 != nil {
        var newValue = curr1.val + carry
        carry = newValue > 9 ? 1 : 0
        newValue = newValue % 10
        let newNode = ListNode(newValue, tail)
        tail = newNode
        curr1 = curr1.next
    }
    
    while curr2 != nil {
        var newValue = curr2.val + carry
        carry = newValue > 9 ? 1 : 0
        newValue = newValue % 10
        let newNode = ListNode(newValue, tail)
        tail = newNode
        curr2 = curr2.next
    }
    
    if carry == 1 {
        let newNode = ListNode(1, tail)
        return newNode
    }
    
    return tail
    
}
