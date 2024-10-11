func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
    let n = position.count
    // 将车的位置和速度结合为元组，并按位置从远到近排序
    let cars = zip(position, speed).sorted { $0.0 > $1.0 }
    
    var fleets = 0
    var lastTime: Double = 0
    
    for (pos, spd) in cars {
        // 计算当前车到达目标所需的时间
        let time = Double(target - pos) / Double(spd)
        // 如果这辆车所需时间超过了前一辆车（即无法追上），则形成新的车队
        if time > lastTime {
            fleets += 1
            lastTime = time
        }
    }
    
    return fleets
}




func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
    var fleets = 0
    var lastTime: Double = 0
    // 按位置从大到小排序
    let sortedCars = zip(position, speed).sorted { $0.0 > $1.0 }
    
    for (pos, spd) in sortedCars {
        let time = Double(target - pos) / Double(spd)
        // 如果这辆车比前面的车用的时间长或相等，它就是新的车队
        if time > lastTime {
            fleets += 1
            lastTime = time
        }
    }
    
    return fleets
}
