let n = "\n"

let task1 = "task2.1"
let a = 1
var b = 2
let c : Double = 3.0
var d : String = "four"
print(task1)
print(a, b, c, d, n)

let task2 = "task2.2"
let decimalInt = 5
let binaryInt = 0b101 
let hexInt = 0x5 
let e = 0.36e5
let additional = 12305670.9805e-9
print(task2)
print(decimalInt, binaryInt, hexInt)
print(e)
print(additional, n)

let task3 = "task2.3"
typealias alias = String
let name:alias = "Text"

typealias Text = String

let text1: Text = "123"
let text2: Text = "456"
let text3: Text = "abc789"

print(task3)
print(name)
if Int(text1) != nil
{
    print("Number: \(text1)") 
}
else 
{
    print("Not a number: \(text1)") 
}

if Int(text2) != nil
{
    print("Number: \(text2)") 
}
else 
{
    print("Not a number: \(text2)") 
}

if Int(text3) != nil
{ 
    print("Number - \(text3)")
}
else 
{ 
    print("Not a number: \(text3)") 
}

var tuple = (year: 2023, faculty: "FIT",course: 3)
print(tuple.year, tuple.faculty, tuple.course)

let (year, faculty, course) = tuple

let sameTuple : (Int, String, Int) = tuple

print("By name: \(tuple.year), \(tuple.faculty), \(tuple.course)")
print("By index: \(tuple.0), \(tuple.1), \(tuple.2)")

tuple.0 = 0000
tuple.1 = "ABC"
tuple.2 = 0

print("Changes: \(tuple.0), \(tuple.1), \(tuple.2)")
print("Constants: \(year), \(faculty), \(course)")
print("sameTuple: \(sameTuple.0), \(sameTuple.1), \(sameTuple.2)\n")

let task4 = "task2.4"
let withNumber = "123"
let withoutNumber = "abc"
var optInt: Int? = Int(withNumber)

print(task4)
print("Optional Int: \(optInt!)\n")

let task5 = "task2.5"
print(task5)
if let num = optInt {
    print("Int \(optInt!) is not string and it is number: \(num)")
} 
else {
    print("Integer \(optInt!) is string")
}

let task6 = "\ntask2.6"
let(year2, speciality, group) = (2023, "POIBMS", 7)
let defaultName = "noname"
var userName: String? = "name" // по умолчанию равно nil
var nameToUse = userName ?? defaultName

print(task6)
print(year2, speciality, group)
print(nameToUse)

let task7 = "\ntask2.7"
let months = ["December", "January", "February"]
let count = months.count

print(task7)
for i in 0..<count {
 print("Month \(i + 1) is called \(months[i])")
}

let task8 = "\ntask2.8"
let one = 1
var two = 2
let result = "\(one) times \(two) is \(Double(one) * Double(two))"
let dollarSign = "\u{24}\n" 
print(task8)
print(result)
print(dollarSign)

let task9 = "task2.9"
print(task9)
typealias Operation = (operandOne: Double, operandTwo: Double, operation: Character) 
let someOperation: Operation = (1.23, 4, "?") 
switch someOperation { 
    case (_, _, "+"): 
        print("Sum: \(someOperation.0 + someOperation.1)\n") 
    case (_, _, "-"): 
        print("Substract: \(someOperation.0 - someOperation.1)\n") 
    case (_, _, "/"): 
        print("Divine: \(someOperation.0 / someOperation.1)\n") 
    case (_, _, "*"): 
        print("Multiply: \(someOperation.0 * someOperation.1)\n") 
    default: 
        print("Unknown operation\n")    
} 

let task10 = "task2.10"
print(task10)
let array = [0,1,2,3]
for elem in array
{
    print("Array element: \(elem)")
}

var ind = 0
var sum = 0
repeat 
{
    for i in stride(from: 0, through: 3, by: 1)
    {
        sum += array[i]
        print("Sum in cycle: \(sum)")
    }
    sum = 0
    for i in 0...3
    {
        sum += array[i]
        print("Sum of array: \(sum)")
    }
    sum = 0
    for i in (0...3).reversed()
    {
        sum += array[i]
        print("Sum in reversed order: \(sum)")
    }
    sum = 0
    sum += array[ind]
    ind = ind + 1
    print("Sum in repeat: \(sum)")
}
while ind < array.count

var i = 2
while (i <= 10) 
{
  guard i % 2 == 0 else 
    {
        i = i + 1
        continue
    }
  print("Guard: \(i)")
  i = i + 1
} 