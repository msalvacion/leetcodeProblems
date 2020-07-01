func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    //input validation
    guard intervals.count > 0 else {return 0}
    //create variables
    
    //using a Range struct to represent time intervals
    var rooms = [[Int]]()
    
    
    //helper for figuring out if there's a conflict with a meeting in the room
    func helper(_ timeSlot: [Int],_ meeting: [Int]) -> Bool {
        
        //check if the meeting is starting during the scheduled meeting
        if meeting[0] > timeSlot[0] && meeting[0] < timeSlot[1] {
            return false
        }
        
        //check if the meeting is ending during the scheduled meeting
        if meeting[1] > timeSlot[0] && meeting[1] < timeSlot[1] {
            return false
        }
        
        return true
    }
    
    
    //go through meetings in intervals and try to put them in rooms
    //return how many rooms we found
    
    meetings: for meeting in intervals {
        
        //go through rooms and try to insert
        //a room into an existing room
        meetingRooms: for (idx, room) in rooms.enumerated() {
            for timeSlot in room {
                //if there's a conflict with any time slot in this room,
                //we can't append it into this room
                if helper(timeSlot, meeting) {
                   continue meetingRooms
                }
            }
            //none of the timeslots in the room had a conflict, so we can schedule
            //our meeting in this room
//            rooms[idx].append(meeting)
            
            continue meetings
        }
        //we couldn't schedule a meeting in a room
        //so we make a new room
        rooms.append(meeting)
    }
        
        
    
    
    return rooms.count
}
