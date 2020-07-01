    func threeSum(_ nums: [Int]) -> [[Int]] {
       
       //input validation
       guard nums.count > 2 else {return [[Int]]()}
       
       var uniqueSolution = Set<[Int]>()
        
       var searchedAlready = Set<Int>()
       
       //twoSum helper function
       //since it's possible to have more than one set that adds up to target
       //we return an array of possibilities
        func twoSum(_ nums: [Int],_ target: Int) -> [[Int]] {
            
            var result = [[Int]]()
            var compliments = Set<Int>()
            for num in nums {
                let compliment = target - num
                if compliments.contains(compliment) {
                    result.append([compliment, num])
                }
                compliments.insert(num)
            }
        
            return result
        }
        
        for (idx,num) in nums.enumerated() {
            
            let compliment = 0 - num
            var subArray = nums
            subArray.remove(at: idx)
            
            if searchedAlready.contains(num) {
                continue
            }
            let compliments = twoSum(subArray, compliment)
            
            for result in compliments {
                var solution = result
                solution.append(num)
                solution.sort()
                uniqueSolution.insert(solution)
            }
            
            searchedAlready.insert(num)
        }
        
        return Array(uniqueSolution)
       
   }
