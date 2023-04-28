let task1 = "task9.1"
print(task1)

//4
protocol IssueStorage {
    associatedtype Item
    var items: [Item] { get set }
    mutating func add(item: Item)
    mutating func remove() -> Item?
}
//1,5
struct IssueList<T>: IssueStorage {
    public var items = [T]()
    
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
    
    //3
    var lastIssue: T? {
        return items.last
    }
}

class Bug {
    open var title: String
    var description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}

//2
var bugs = IssueList<Bug>()
bugs.add(item: Bug(title: "Crash on launch", description: "App crashes immediately after opening."))
bugs.add(item: Bug(title: "Broken link", description: "Link to homepage is broken."))
bugs.add(item: Bug(title: "Missing feature", description: "App needs a search bar."))
bugs.add(item: Bug(title: "Slow performance", description: "App is slow when loading large datasets."))

print("\nBugs:")
for bug in bugs.items {
    print(bug.title)
}

if let lastBug = bugs.lastIssue {
    print("\nLast bug: \(lastBug.title)\n")
}

if let removedBug = bugs.remove() {
    print("Removed bug: \(removedBug.title)\n")
}

print("Bugs after removing one:")
for bug in bugs.items {
    print(bug.title)
}

struct Feature {
    var title: String
    var description: String
}

var features = IssueList<Feature>()
features.add(item: Feature(title: "Dark mode", description: "Add a dark mode to the app."))
features.add(item: Feature(title: "Push notifications", description: "Send push notifications when new content is available."))
features.add(item: Feature(title: "User profiles", description: "Add user profiles with avatar images."))
features.add(item: Feature(title: "Social sharing", description: "Allow users to share content on social media."))

print("\nFeatures:")
for feature in features.items {
    print(feature.title)
}

if let lastFeature = features.lastIssue {
    print("\nLast feature: \(lastFeature.title)\n")
}

if let removedFeature = features.remove() {
    print("Removed feature: \(removedFeature.title)\n")
}

print("Features after removing one:")
for feature in features.items {
    print(feature.title)
}

//6.Универсальный тип
struct Stack<T> {
    var items = [T]()
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T? {
        return items.popLast()
    }
}
//Универсальная функция
func printArray<T>(_ array: [T]) {
    for element in array {
        print(element)
    }
}

//7.Расширение для универсального типа
extension Stack {
    var topItem: T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

//8. Ограничение на тип в универсальном шаблоне можно сделать, используя ключевое слово where и определяя требования для типа
func sum<T: Numeric>(_ a: T, _ b: T) -> T {
    return a + b
}