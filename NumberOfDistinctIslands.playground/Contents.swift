func numDistinctIslands(_ grid: [[Int]]) -> Int {
    //input validation
    guard grid.count > 0 else {return 0}
    
    //create variables
    //using a set to mark islands
    //[[Int]] is a coordinate pair and hashable
    var distinctIslands = Set<[[Int]]>()
    let rows = grid.count
    let columns = grid[0].count
    //using a copy of the grid to mark visited land
    var grid = grid
    
    //traverse grid
    
    for m in 0..<rows {
        for n in 0..<columns {
            if grid[m][n] == 1 {
                var shape = [[Int]]()
                exploreIsland(on: &grid, from: Point(m,n), to: Point(m,n), with: &shape)
                if !distinctIslands.contains(shape) {
                    distinctIslands.insert(shape)
                }
            }
        }
    }
    
    return distinctIslands.count
    
}

typealias Point = (m: Int, n: Int)

let directions = [Point(0,1),
                 Point(1,0),
                 Point(-1,0),
                 Point(0,-1)]

func exploreIsland(on grid: inout [[Int]],from origin: Point, to coordinate: Point, with shape: inout [[Int]]) {
    
    guard grid.count > 0 else {return}
    
    let rows = grid.count
    let columns = grid[0].count
    
    //validate coordinate in global system or visited/water
    if coordinate.m < 0 || coordinate.n < 0 || coordinate.m >= rows || coordinate.n >= columns || grid[coordinate.m][coordinate.n] == 0 {
        return
    }

    //mark as visited
    grid[coordinate.m][coordinate.n] = 0
    
    //localize coordinate
    let localCoordinate = [coordinate.m - origin.m, coordinate.n - origin.n]
    shape.append(localCoordinate)
    
    //check our neighbors
    for direction in directions {
        let destination = Point(coordinate.m + direction.m, coordinate.n + direction.n)
        exploreIsland(on: &grid, from: origin, to: destination, with: &shape)
    }
}

numDistinctIslands([[1]])
