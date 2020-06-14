

struct Queue<T> {
    
    private var mQueue: Array<T>
    init() {
        mQueue = [T]()
    }
    
    mutating func enqueue(_ element: T) {
        mQueue.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard !mQueue.isEmpty else {return nil}
        return mQueue.removeFirst()
    }
    
    func next() -> T? {
        return mQueue.first
    }
    
    var isEmpty: Bool {
        return mQueue.isEmpty
    }
    
    var count: Int {
        return mQueue.count
    }
}
//
// For doing it with O(m*n) space and replacing grids
//typealias Coordinate = (Int, Int)
//
//let directions = [
//    Coordinate(0,1),
//    Coordinate(1, 0),
//    Coordinate(-1, 0),
//    Coordinate(0, -1)
//]

//func orangesRotting(_ grid: [[Int]]) -> Int {
//
//    //make grid
//    //count fresh and rotten oranges
//    //traverse. Increment every time we go down a new level
//
//    guard grid.count > 0 else {return -1}
//
//    var mGrid = grid
//    let rows = mGrid.count
//    let columns = mGrid[0].count
//
//    var freshOranges = 0
//    var queue = Queue<[Coordinate]>()
//    var minutesElasped = -1
//    var rottenOranges = [Coordinate]()
//
//
//    for m in 0..<rows {
//        for n in 0..<columns {
//            switch mGrid[m][n] {
//            case 1: freshOranges += 1
//            case 2: rottenOranges.append((m,n))
//            default: continue
//            }
//        }
//    }
//
//    if freshOranges == 0 {return 0}
//
//    queue.enqueue(rottenOranges)
//
//    while let level = queue.dequeue() {
//        minutesElasped += 1
//        var newRottenOranges = [Coordinate]()
//
//        for coordinate in level {
//
//            for direction in directions {
//                let destination = (coordinate.0 + direction.0, coordinate.1 + direction.1)
//
//                if destination.0 < 0 || destination.0 >= rows || destination.1 < 0 || destination.1 >= columns {
//                    continue
//                }
//
//                switch mGrid[destination.0][destination.1] {
//                case 1:
//
//                    mGrid[destination.0][destination.1] = 2
//                    freshOranges -= 1
//                    newRottenOranges.append(destination)
//                default: continue
//                }
//            }
//        }
//
//        if newRottenOranges.count > 0 {
//            queue.enqueue(newRottenOranges)
//        }
//
//    }
//
//    return freshOranges == 0 ? minutesElasped : -1
//
//}

struct Coordinate: Hashable, Equatable{
    var m: Int
    var n: Int

    static func +(firstCoordinate: Coordinate, secondCoordinate: Coordinate) -> Coordinate {
        let newM = firstCoordinate.m + secondCoordinate.m
        let newN = firstCoordinate.n + secondCoordinate.n

        return Coordinate(m: newM, n: newN)
    }
}

let directions = [
    Coordinate(m: 0, n: 1),
    Coordinate(m: 1, n: 0),
    Coordinate(m: -1, n: 0),
    Coordinate(m:0, n: -1)
]
func orangesRotting(_ grid: [[Int]]) -> Int {

    guard grid.count > 0 else {return -1}

    let rows = grid.count
    let columns = grid[0].count
    
    var visited = Set<Coordinate>()
    var rottenOranges = [Coordinate]()
    var queue = Queue<[Coordinate]>()
    var timeElasped = -1
          
    
    //O(M*N)
    for m in 0..<rows {
        for n in 0..<columns {
            switch grid[m][n] {
            case 0:
                visited.insert(Coordinate(m: m, n: n))
            case 2:
                rottenOranges.append(Coordinate(m: m, n: n))
            default:
                continue
            }
        }
    }
    
    queue.enqueue(rottenOranges)
    
    while let batch = queue.dequeue() {
        timeElasped += 1
        var newRottenOranges = [Coordinate]()
        
        for coordinate in batch {
            
            visited.insert(coordinate)
            
            for direction in directions {
                let destination = coordinate + direction
                
                //bounds check
                
                if destination.m < 0 || destination.m >= rows || destination.n < 0 || destination.n >= columns {
                    continue
                }
                
                let orange = grid[destination.m][destination.n]
                
                if orange == 1 && !visited.contains(destination) {
                    newRottenOranges.append(destination)
                }
                
                visited.insert(destination)
            }
        }
        
        //we've gone through a round of rotting
        if newRottenOranges.count > 0 {
            queue.enqueue(newRottenOranges)
        }
        
    }

    return visited.count < rows * columns ? -1 : timeElasped
}

//single orange test 4
//let input = [[2,1,1],[1,1,0],[0,1,1]]

//two separate sets of oranges test 4
//let input = [[2,1,1],[1,1,0],[0,1,1],[0,0,0],[2,1,1]]

//no fresh oranges test 0
//let input = [[0,2]]

//unreachable fresh orange test -1
//let input = [[2,1,1],[0,1,1],[1,0,1]]

//single grid test 0
//let input = [[0]]

//invalid input -1
//let input = [[Int]]()

let input = [[2],[1],[1],[1],[2],[1],[1]]
orangesRotting(input)


