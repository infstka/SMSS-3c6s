import Foundation

//1) Сделайте расширение для типа Int с методами проверки четности, нечетности, реализации нового сабскрипта – который возвращает  количество цифр в числе в соответсвии с заданной цифрой в сабскрипте (например, 222[1] -> 0 , 222[2] -> 3).

let task1 = "task8.1"
print(task1)

extension Int {
    
    var isEven: Bool {
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return !self.isEven
    }
    
    subscript(digit: Int) -> Int {
        var number = self
        var count = 0
        while number > 0 {
            let remainder = number % 10
            if remainder == digit {
                count += 1
            }
            number /= 10
        }
        return count
    }
}

let number = 222
print(number.isEven) // false
print(number[1]) // 0
print(number[2]) // 3

//2) Добавьте через расширение новый инициализатор в классе Bug, а также метод, возвращающий количество дней устранения бага (если баг не закрыт, т.е. любой стаутс отличный от Closed, считается как текущая дата – дата открытия бага), метод для переоткрытия бага (меняется статус на Reopened и  обновляется дата).
enum Status {
    case open
    case inProgress
    case resolved
    case closed
    case reopened
}

enum Priority: Int {
    case low = 0
    case medium = 1
    case high = 2
}

class Bug {
    var title: String
    var description: String
    var priority: Priority
    var status: Status
    var dateCreated: Date
    var assignedTo: String?
    
    init(title: String, description: String, priority: Priority, status: Status, dateCreated: Date) {
        self.title = title
        self.description = description
        self.priority = priority
        self.status = status
        self.dateCreated = dateCreated
    }
}

extension Bug {
    convenience init(title: String, description: String, priority: Priority) {
        self.init(title: title, description: description, priority: priority, status: .open, dateCreated: Date())
    }
    
    func daysToClose() -> Int? {
        guard self.status != .closed else {
            return nil
        }
        let calendar = Calendar.current
        let currentDate = calendar.startOfDay(for: Date())
        let creationDate = calendar.startOfDay(for: self.dateCreated)
        let components = calendar.dateComponents([.day], from: creationDate, to: currentDate)
        return components.day
    }
    
    func reopen() {
        self.status = .reopened
        self.dateCreated = Date()
    }
}

let bug = Bug(title: "Error", description: "Problem with function", priority: .medium)

print("Bug name: \(bug.title)")
print("Priority: \(bug.priority)")
if let daysToClose = bug.daysToClose() {
    print("Days before bug closing: \(daysToClose)")
} else {
    print("Bug is closed")
}
bug.reopen()
print("Bug status: \(bug.status)")
 
let task2 = "\ntask8.2"
print(task2)

//1) Создайте протокол BugTracker с коллекцией Bug и  следующими функциями – создать, назначить, изменить статус Bug ( см. л.р. №5), сортировка багов.
protocol BugTracker {
    var bugs: [Bug] { get set }
    
    func createBug(title: String, description: String, priority: Priority)
    func assignBug(_ bug: Bug, to user: String)
    func changeBugStatus(_ bug: Bug, to status: Status)
    func sortBugs(by sortType: BugSortType)
    
    func generateReport() -> String
}

extension BugTracker {
    //3) Расширьте протокол BugTracker функцией подготовки отчета.
    func generateReport() -> String {
        var report = ""
        report += "\nBug Report\n\n"
        for bug in bugs {
            report += "Title: \(bug.title)\n"
            report += "Description: \(bug.description)\n"
            report += "Priority: \(bug.priority)\n"
            report += "Status: \(bug.status)\n"
            if let daysToClose = bug.daysToClose() {
                report += "Days before bug closing: \(daysToClose)\n"
            } else {
                report += "Bug is closed\n"
            }
            if let assignedTo = bug.assignedTo {
                report += "Assigned to: \(assignedTo)\n"
            }
            report += "\n"
        }
        return report
    }
}

enum BugSortType {
    case priority
    case dateCreated
}

//2) Реализуйте требуемые функции BugTracker в классе JIRA.
class JIRA: BugTracker {
    var bugs: [Bug] = []
    
    func createBug(title: String, description: String, priority: Priority) {
        let bug = Bug(title: title, description: description, priority: priority)
        bugs.append(bug)
    }
    
    func assignBug(_ bug: Bug, to user: String) {
        bug.assignedTo = user
    }
    
    func changeBugStatus(_ bug: Bug, to status: Status) {
        bug.status = status
    }
    
    func sortBugs(by sortType: BugSortType) {
        switch sortType {
        case .priority:
            bugs.sort(by: { $0.priority.rawValue > $1.priority.rawValue })
        case .dateCreated:
            bugs.sort(by: { $0.dateCreated > $1.dateCreated })
        }
    }
}

//4) Проверье работу JIRA создав его инстанс.
let jira = JIRA()

jira.createBug(title: "First bug", description: "Error in function X", priority: .medium)
jira.createBug(title: "Second bug", description: "Error in function Y", priority: .high)
jira.createBug(title: "Third bug", description: "Error in function Z", priority: .low)

let bug1 = jira.bugs[0]
jira.assignBug(bug1, to: "User1")
jira.changeBugStatus(bug1, to: .inProgress)

let bug2 = jira.bugs[1]
jira.assignBug(bug2, to: "User2")

let bug3 = jira.bugs[2]
jira.changeBugStatus(bug3, to: .closed)

jira.sortBugs(by: .priority)

print(jira.generateReport())

//4
protocol Named {
    var name: String { get set }
}

//5
extension Named {
    func greet() {
        print("Hello, my name is \(name).")
    }
}