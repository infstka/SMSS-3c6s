import Foundation

enum Direction {
    case north(vertical: Bool) //ассоциированное 
    case south(vertical: Bool) 
    case east
    case west
    var isVertical: Bool {
        switch self {
        case .north(let vertical), .south(let vertical):
            return vertical
        default:
            return false
        }
    }
}

var direction = Direction.north(vertical: true)
direction = .south(vertical: false) //меняем ассоц знач, чтобы изменить значение свойства
print(direction.isVertical) //выведет false

let task1 = "\ntask6.1"
//1)Создайте перечисление с месяцами. Напишите в перечислении функцию, которая возвращает по месяцу пору года.Члены перечисления должны иметь связанные значения.
enum Month: Int {
    case january = 1
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
    
    func timeOfYear() -> String {
    switch self {
        case .december, .january, .february:
        return("Winter")
        case .march, .april, .may:
        return("Spring")
        case .june, .july, .august:
        return("Summer")
        case .september, .october, .november:
        return("Autumn") 
    }
    }
}

let january = Month.january
let february = Month.february
let march = Month.march
let april = Month.april
let may = Month.may
let june = Month.june
let july = Month.july
let august = Month.august
let september = Month.september
let october = Month.october
let november = Month.november
let december = Month.december

//2)Используйте перечисление для установки месяца. Определите пору года.
let januaryRaw = Month(rawValue: 1)!
let februaryRaw = Month(rawValue: 2)!
let marchRaw = Month(rawValue: 3)!
let aprilRaw = Month(rawValue: 4)!
let mayRaw = Month(rawValue: 5)!
let juneRaw = Month(rawValue: 6)!
let julyRaw = Month(rawValue: 7)!
let augustRaw = Month(rawValue: 8)!
let septemberRaw = Month(rawValue: 9)!
let octoberRaw = Month(rawValue: 10)!
let novemberRaw = Month(rawValue: 11)!
let decemberRaw = Month(rawValue: 12)!

//3)Допишите перечисление ArithmeticExpression таким образом, чтобы оно могло реализовать любое выражение с использованием операций сложения, вычитания, умножения, деления и возведения в степень.
enum ArithmeticExpression {
    case number(Double)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case substraction(ArithmeticExpression, ArithmeticExpression)
    indirect case multiply(ArithmeticExpression, ArithmeticExpression)
    indirect case division(ArithmeticExpression, ArithmeticExpression)
    indirect case power(ArithmeticExpression, ArithmeticExpression)
    
    func calculate(expression: ArithmeticExpression? = nil) -> Double{
        let expression = (expression == nil ? self : expression)
        switch expression! {
            case .number(let value):
            return value
            case .addition(let valueOne, let valueTwo):
            return self.calculate(expression: valueOne) + self.calculate(expression: valueTwo)
            case .substraction(let valueOne, let valueTwo):
            return self.calculate(expression: valueOne) - self.calculate(expression: valueTwo)
            case .multiply(let valueOne, let valueTwo):
            return self.calculate(expression: valueOne) * self.calculate(expression: valueTwo)
            case .division(let valueOne, let valueTwo):
            return self.calculate(expression: valueOne) / self.calculate(expression: valueTwo)
            case .power(let valueOne, let valueTwo):
            return ( pow(self.calculate(expression: valueOne), self.calculate(expression: valueTwo)) )
        }
    }
}

let addition = ArithmeticExpression.addition(.number(6), .number(3))
let substraction = ArithmeticExpression.substraction(.number(6), .number(3))
let multiply = ArithmeticExpression.multiply(.number(6), .number(3))
let division = ArithmeticExpression.division(.number(6), .number(3))
let power = ArithmeticExpression.power(.number(6), .number(3))

print(task1)
print("By name: \(january) - \(january.timeOfYear())")
print("By name: \(february) - \(february.timeOfYear())")
print("By name: \(march) - \(march.timeOfYear())")
print("By name: \(april) - \(april.timeOfYear())")
print("By name: \(may) - \(may.timeOfYear())")
print("By name: \(june) - \(june.timeOfYear())")
print("By name: \(july) - \(july.timeOfYear())")
print("By name: \(august) - \(august.timeOfYear())")
print("By name: \(september) - \(september.timeOfYear())")
print("By name: \(october) - \(october.timeOfYear())")
print("By name: \(november) - \(november.timeOfYear())")
print("By name: \(december) - \(december.timeOfYear())\n")

print("By value: \(januaryRaw) - \(january.timeOfYear())")
print("By value: \(februaryRaw) - \(february.timeOfYear())")
print("By value: \(marchRaw) - \(march.timeOfYear())")
print("By value: \(aprilRaw) - \(april.timeOfYear())")
print("By value: \(mayRaw) - \(may.timeOfYear())")
print("By value: \(juneRaw) - \(june.timeOfYear())")
print("By value: \(julyRaw) - \(july.timeOfYear())")
print("By value: \(augustRaw) - \(august.timeOfYear())")
print("By value: \(septemberRaw) - \(september.timeOfYear())")
print("By value: \(octoberRaw) - \(october.timeOfYear())")
print("By value: \(novemberRaw) - \(november.timeOfYear())")
print("By value: \(decemberRaw) - \(december.timeOfYear())\n")

print("Addition: \(addition.calculate())")
print("Substraction: \(substraction.calculate())")
print("Multiply: \(multiply.calculate())")
print("Division: \(division.calculate())")
print("Power: \(power.calculate())\n")


let task2 = "task6.2"
print(task2)

enum Status {
    case Open
    case Closed
    case Resolved
    case Reopened
    case In_Progress
}
    
enum Severity {
    case High
    case Medium
    case Low
}
    
enum Priority {
    case Blocker
    case Critical
    case Major
    case Minor
}

class Bug {
    static var ID: Int = 0
    var Notifyer: String{
        willSet(newValueOfNotify){
            print("Will change our notifyer from \(self.Notifyer) to \(newValueOfNotify)")
        }
        didSet(oldValueOfNotify){
            print("Old notifyer \(oldValueOfNotify) has changed to \(self.Notifyer)")
        }
    }
    let Summary: String
    var DateTime: String
    var StepsToReproduce: Array<String>? = nil
    var Assignee: String
    var FixedProductVersion: String? = nil
    var priority: Priority
    let severity: Severity
    var status: Status
    
    lazy var whenWasNotifyed: String = self.generateNotify()
    
    func generateNotify() -> String {
        return "Who notifyed: \(self.Notifyer); When notifyed: \(self.DateTime)"
    }

    func changePriority(_ updatePrior: Priority){
        self.priority = updatePrior
    }

    func signAssignee(_ sign: String){
        self.Assignee = sign
    }
    
    func changeStatus(_ updateStat: Status){
        self.status = updateStat
    }

    subscript(stepNumber: Int) -> String? {
        get {
            if let step = self.StepsToReproduce?[stepNumber] {
                return step
            }
            return nil
        }
    }
    
    convenience init(info: String){
        self.init()
        print(info)
    }
    
    init() {
        self.priority = Priority.Minor
        self.Notifyer = "none"
        self.Summary = "none"
        self.DateTime = "none"
        self.StepsToReproduce = nil
        self.Assignee = "none"
        self.priority = Priority.Minor
        self.severity = Severity.Low
        self.status = Status.In_Progress
        self.FixedProductVersion = nil
    } 
    
    init(severity: Severity, status: Status) {
        self.severity = severity
        self.status = status
        self.priority = Priority.Minor
        self.Notifyer = "none"
        self.Summary = "none"
        self.DateTime = "none"
        self.StepsToReproduce = nil
        self.Assignee = "none"
        self.FixedProductVersion = nil
    }
    
    init(notifyer: String,
    summary: String,
    dateTime: String,
    stepsToReproduce: Array<String>?,
    _ assignee: String,
    _ fixedProductVersion: String?) {
        self.Notifyer = notifyer
        self.Summary = summary
        self.DateTime = dateTime
        self.StepsToReproduce = stepsToReproduce
        self.Assignee = assignee
        self.FixedProductVersion = fixedProductVersion   
        self.priority = Priority.Minor
        self.severity = Severity.Low
        self.status = Status.In_Progress
        Bug.ID += 1
    }
    
    init?(fixedProductVersion: String){
        self.priority = Priority.Minor
        self.Notifyer = "none"
        self.Summary = "none"
        self.DateTime = "none"
        self.StepsToReproduce = nil
        self.Assignee = "none"
        self.FixedProductVersion = nil
        self.priority = Priority.Minor
        self.severity = Severity.Low
        self.status = Status.In_Progress
        if fixedProductVersion.isEmpty {
            return nil
        }
        self.FixedProductVersion =  fixedProductVersion 
    }
    
    func showSmt(){
        print("Assignee: \(self.Assignee) | Date: \(self.DateTime)")
    }
}

var bugOne: Bug = Bug.init(notifyer: "test", summary: "test", dateTime: "test", stepsToReproduce: nil, "test", nil)
var bugTwo: Bug = Bug.init(notifyer: "test", summary: "test", dateTime: "test", stepsToReproduce: nil, "test", nil)

print("ID: \(Bug.ID)")
bugOne.changePriority(Priority.Blocker)
bugOne.signAssignee("Assignee1")
bugOne.changeStatus(Status.Closed)
bugOne.Notifyer = "Notifyer1"
bugOne.DateTime = "01.01.2000"
print(bugOne.whenWasNotifyed)
bugOne.DateTime = "02.02.2000"
print("Changed date to \(bugOne.DateTime)\n")
print(bugOne.whenWasNotifyed)
print("\(bugOne.priority) + \(bugOne.Assignee) + \(bugOne.status)")
bugOne.FixedProductVersion = "0.1"
print("Version: \(bugOne.FixedProductVersion!)")

var bugs = [Any]()
bugs.append(bugOne)
bugs.append(bugTwo)
var usualBugs = [Bug?]()
var countUsualBugs = 0

for elem in bugs{
    if elem is Bug{
        let usualBug: Bug = elem as! Bug
        usualBugs.append(usualBug)
        countUsualBugs += 1
    }
}

print("Amount of Bug: \(countUsualBugs)")

for elem in usualBugs{
    print("About assignee")
    elem!.showSmt()
}