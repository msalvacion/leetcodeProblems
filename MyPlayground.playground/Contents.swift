import UIKit


    
struct Coordinate: Hashable {
    
    var row: Int
    var column: Int
    
    init(_ row: Int,_ column: Int) {
        self.row = row
        self.column = column
    }
}

let directions = [Coordinate(0,1), Coordinate(1,0), Coordinate(-1,0), Coordinate(0,-1)]
let LAND: Character = "1"
let WATER: Character = "0"

func numIslands(_ grid: [[Character]]) -> Int {
    
    //this map doesn't exist
    guard grid.count != 0 else {
        return -1
    }
    
    let numRows = grid.count
    let numColumns = grid[0].count
    var count = 0
    var visitedLand = Set<Coordinate>()
    var queue = Queue<Coordinate>()
    
    func buildIsland(at coordinate: Coordinate) {
        var islandBuilder = Queue<Coordinate>()
        islandBuilder.enqueue(coordinate)
        
        while !islandBuilder.isEmpty {
            guard let land = islandBuilder.dequeue() else {break}
                        
            print("land:", land.row, land.column)
            for direction in directions {
                let neighbor = Coordinate(land.row + direction.row, land.column + direction.column)
                
                print("neighbor:", neighbor.row, neighbor.column, visitedLand.contains(neighbor))
                
                //Check if neighbor is within bounds
                if (neighbor.column < 0 || neighbor.row < 0 || neighbor.column >= numColumns || neighbor.row >= numRows) || visitedLand.contains(neighbor) {
                    continue
                }
                
                if grid[neighbor.row][neighbor.column] == LAND {
                    islandBuilder.enqueue(neighbor)
                    visitedLand.insert(neighbor)
                    continue
                }
            }
            visitedLand.insert(land)
            
        }
        count += 1
    }
    
    for row in 0..<numRows {
        for column in 0..<numColumns {
            if grid[row][column] == LAND && !visitedLand.contains(Coordinate(row, column)) {
                buildIsland(at: Coordinate(row, column))
            }
        }
    }

    
    return count
}
    


struct Queue<T> {
  fileprivate var array = [T]()

  public var count: Int {
    return array.count
  }

  public var isEmpty: Bool {
    return array.isEmpty
  }

  public mutating func enqueue(_ element: T) {
    array.append(element)
  }

  public mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }

  public var front: T? {
    return array.first
  }
}

let grid: [[Character]] = [["1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","0","1","0","1","1"],["0","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","0"],["1","0","1","1","1","0","0","1","1","0","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","0","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","0","1","1","1","1","1","1","0","1","1","1","0","1","1","1","0","1","1","1"],["0","1","1","1","1","1","1","1","1","1","1","1","0","1","1","0","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","0","1","1"],["1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["0","1","1","1","1","1","1","1","0","1","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","0","1","1","1","1","1","1","1","0","1","1","1","1","1","1"],["1","0","1","1","1","1","1","0","1","1","1","0","1","1","1","1","0","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","1","1","0"],["1","1","1","1","1","1","1","1","1","1","1","1","1","0","1","1","1","1","0","0"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"],["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"]]

//let grid: [[Character]] = [["1", "1", "0", "0", "0", "1", "0"],["1", "0", "1", "1", "0", "1", "0"],["1", "0", "0", "0", "0", "0", "0"],["0", "0", "1", "1", "0", "0", "0"]]

let grid2: [[Character]] = [["1", "1", "0"],
["1","0","0"]]

numIslands(grid)

