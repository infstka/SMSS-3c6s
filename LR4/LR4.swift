let task1 = "task4.1"
var array = Array(5...125)
var dropFirst = array.dropFirst(5)
var dropLast = dropFirst.dropLast(5)
dropLast.insert(0, at: 116)
dropLast.insert(0, at: 117)
dropLast.insert(0, at: 118)
dropLast.insert(0, at: 119)
dropLast.insert(0, at: 120)
print(task1)
print("Original array:\n \(array)")
print("Array with dropped first 5 elements and replaced last 5 elements:\n \(dropLast)")
print("Enumerated array:")
dropLast.enumerated().forEach({print("\($0) - \($1)")})

let task2 = "\ntask4.2"
var chessDict:[String:(alpha:Character, num:Int)?] = [:]
chessDict = [
    "White King" : ("D", 1),
    "White Queen" : ("F", 4),
    "White Knight" : ("A", 6),
    "Black King" : ("D", 8),
    "Black Queen" : ("E", 8),
    "Black Knight" : ("F", 6),
]
print(task2)
print(chessDict)

print("\nOriginal position of the figures")
for figureName in chessDict{
    if let coordsTuple = figureName.value{
        print("\(figureName.key) on \(coordsTuple.alpha)\(coordsTuple.num)")
    }
    else{
        print("\(figureName.key) is killed")
    }
}

chessDict.updateValue(nil, forKey: "Black Knight")
chessDict.updateValue(("E", 8), forKey: "Black King")
chessDict.updateValue(("H", 4), forKey: "Black Queen")
chessDict.updateValue(("F", 6), forKey: "White Queen")
chessDict.updateValue(("B", 4), forKey: "White Knight")

print("\nNew position of the figures")
for figureName in chessDict{
    if let coordsTuple = figureName.value{
        print("\(figureName.key) on \(coordsTuple.alpha)\(coordsTuple.num)")
    }
    else{
        print("\(figureName.key) is killed")
    }
}

print("\n", chessDict, "\n")