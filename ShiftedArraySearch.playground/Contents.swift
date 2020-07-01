func shiftedArrSearch(shiftArr: [Int], num: Int) -> Int {
  
    guard shiftArr.count > 0 else {return -1}
    
    guard let pivot = findPivotIndex(shiftArr) else {return -1}
  
    //if the start of the array is greater than the number
    //that means the number is not in this shifted portion since
    //our array is already sorted.
    //shiftArray[0]...shiftArray[pivot] cannot contain our number
    //so we check the other side
    if pivot == 0 || shiftArr[0] > num {
        return binarySearch(shiftArr, pivot, shiftArr.count - 1, num)
    }
    //otherwise the number we're looking for is in the other subarray
    return binarySearch(shiftArr, 0, pivot - 1, num)
}

func binarySearch(_ sortedArray: [Int],_ left: Int,_ right: Int,_ target: Int) -> Int {
    
    var leftIdx = left
    var rightIdx = right
    
    while leftIdx <= rightIdx {
        
        let middleIdx = leftIdx + (rightIdx - leftIdx)/2
        let middleValue = sortedArray[middleIdx]
        
        if target == middleValue {
            return middleIdx
        }
        
        if target > middleValue {
            leftIdx = middleIdx + 1
        } else {
            rightIdx = middleIdx - 1
        }
    }
    
    //we got all the way through and never found
    //our number
    return -1
}

func findPivotIndex(_ arr: [Int]) -> Int? {
    guard arr.count > 0 else {return nil}
    guard arr.count > 1 else {return 0}
    
    var left = 0
    var right = arr.count - 1
    
    while left <= right {
        let middle = left + (right - left)/2
        
        if middle == 0 {
            return arr[middle] > arr[middle + 1] ? 1 : 0
        }
        
        if arr[middle] < arr[middle - 1] {
            return middle
        }
        
        //the pivot is to the left of middle
        if arr[middle] < arr[0] {
            right = middle - 1
        }
        //otherwise it's to the right
        else {
            left = middle + 1
        }
    }
    
    return 0
}

let shiftArr = [3,4,5,6,1,2]
let num = 6

let tests = [[2,1],
[1,2,3,4,5,6],
[6,1,2,3,4,5],
[3,4,5,6,1,2],
[0],
[Int]()
]

for test in tests {
    print(findPivotIndex(test))
}

shiftedArrSearch(shiftArr: shiftArr, num: num)
