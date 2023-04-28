let task1 = "task10.1"
print(task1)

protocol IssueStorage {
    associatedtype Item
    var items: [Item] { get set }
    mutating func add(item: Item)
    mutating func remove() -> Item?
}

struct IssueList<T>: IssueStorage {
    var items = [T]()
    
    mutating func add(item: T) {
        items.append(item)
    }
    
    mutating func remove() -> T? {
        if items.isEmpty {
            return nil
        } else {
            return items.removeFirst()
        }
    }
    
    var lastIssue: T? {
        return items.last
    }
    
    //throws
    mutating func remove(atIndex index: Int) throws -> T {
        guard index >= 0 && index < items.count else {
            throw CustomError.indexOutOfRange
        }
        return items.remove(at: index)
    }
}

class Bug {
    var title: String
    var description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    static func +(lhs: Bug, rhs: Bug) -> Bug {
        let combinedTitle = "\(lhs.title) & \(rhs.title)"
        let combinedDescription = "\(lhs.description) & \(rhs.description)"
        return Bug(title: combinedTitle, description: combinedDescription)
    }
}

//тип ошибки соответствует протоколу ошибки
enum CustomError: Error {
    case indexOutOfRange
}

var bugs = IssueList<Bug>()
bugs.add(item: Bug(title: "Crash on launch", description: "App crashes immediately after opening."))
bugs.add(item: Bug(title: "Broken link", description: "Link to homepage is broken."))
bugs.add(item: Bug(title: "Missing feature", description: "App needs a search bar."))
bugs.add(item: Bug(title: "Slow performance", description: "App is slow when loading large datasets."))

print("\nBugs:")
for bug in bugs.items {
    print(bug.title)
}

//обработчик
//try? try!
do {
    let removedBug = try bugs.remove(atIndex: 1)
    print("\nRemoved bug: \(removedBug.title)\n")
} catch CustomError.indexOutOfRange {
    print("Index out of range error occurred.")
}
print("Bugs after removing one:")
for bug in bugs.items {
    print(bug.title)
}

let bug1 = Bug(title: "Crash on launch", description: "App crashes immediately after opening.")
let bug2 = Bug(title: "Broken link", description: "Link to homepage is broken.")
let combinedBugs = bug1 + bug2
print("\nCombined bugs title: \(combinedBugs.title)\nCombined bugs description: \(combinedBugs.description)")

print("\n")
//8
struct MyType {
    var value: Int
    
    static func +(lhs: MyType, rhs: MyType) -> MyType {
        return MyType(value: lhs.value + rhs.value)
    }
}

let a = MyType(value: 2)
let b = MyType(value: 3)
let c = a + b // использование стандартного оператора
print(c.value) // 5

extension MyType {
    static func -(lhs: MyType, rhs: MyType) -> MyType {
        return MyType(value: lhs.value - rhs.value)
    }
}

let d = a - b // использование нового оператора
print(d.value) // -1
