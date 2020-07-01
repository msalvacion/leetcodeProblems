
class LRUCache {
    
    class Node {
        var key: Int
        var value: Int
        private (set) var age: UInt64 = 0
            
                
        init(key: Int, value: Int) {
            self.key = key
            self.value = value
        }
        
        func incrementAge() {
            age += 1
        }
        
        var next: Node?
    }
        
    
    init(_ capacity: Int) {
        
    }
    
    func get(_ key: Int) -> Int {
        
    }
    
    
}
/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
