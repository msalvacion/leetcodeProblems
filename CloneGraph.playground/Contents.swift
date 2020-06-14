import UIKit

public class Node {
     public var val: Int
     public var neighbors: [Node?]
     public init(_ val: Int) {
         self.val = val
         self.neighbors = []
     }
 }

//using node values to determine I've seen them
var visited = Dictionary<Int, Node>()

func cloneGraph(_ node: Node?) -> Node? {
    return dfs(node)
}

func dfs(_ node: Node?) -> Node? {
    
    guard let node = node else {return nil}
    
    var newNode = Node(node.val)
    
    for adj in node.neighbors {
        guard let adj = adj else {continue}
        
        if visited[adj.val] != nil {
            print("appending visited", adj.val)
            newNode.neighbors.append(visited[adj.val])
        } else {
            print("dfsing this node", adj.val)
            newNode.neighbors.append(dfs(adj))
        }
    }
    
    visited[newNode.val] = newNode
    
    return newNode
}

let node = Node(1)
let node2 = Node(2)
let node3 = Node(3)
let node4 = Node(4)
node4.neighbors = [node, node3]
node3.neighbors = [node4, node2]
node2.neighbors  = [node3, node]
node.neighbors = [node2, node4]

cloneGraph(node)
