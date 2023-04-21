let task1 = "task7.1"
print(task1)

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
    
    //вспомогательный инициализатор
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
    
    //проваливающийся инициализатор
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