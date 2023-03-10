let task1 = "task5.1"
print(task1)
//Напишите функцию sum с переменным числом аргументов типа Double, которая суммирует все переданные значения
func sum(nmbrsArr nums: [Double]) -> Double {
    var sum: Double = 0
    for i in nums {
        sum += i
    }
    return sum
}

func sum(nums: Double...) -> Double {
    return sum(nmbrsArr: nums)
}
print("Sum: \(sum(nums: 1, 1, 1, 1))")

//Напишите функцию average с переменным числом аргументов типа Double, которая вызывает функцию sum  и считает среднее переданных чисел.
func average(nums: Double...) -> Double {
    return sum(nmbrsArr: nums) / Double(nums.count)
}
print("Average: \(average(nums: 1, 1, 1, 1))")

//Напишите функцию с inout параметром, которая меняет знак аргумента на противоположный
func inoutFunc(_ a: inout Int, _ b: inout Int) -> (){
    a = -a
    b = -b
    print("Inout: \(a), \(b)")
}
var a = 1, b = 2
inoutFunc(&a, &b)

//Напишите функцию doWithTwo  с тремя аргументами: первый функциональный тип   (Double...) -> Double, два  других типа Double, возвращаемое значение Double.
func doWithTwo(doFunc: (Double...) -> Double, arg1: Double, arg2: Double) -> Double {
    return doFunc(arg1, arg2)
}
print("doWithTwo: \(doWithTwo(doFunc: sum, arg1: 2, arg2: 3))")

//Напишите функцию operation, которая принимает в качестве параметра строку,  а возвращает функциональный тип:
func operation(which: String) -> (Double...) -> Double {
    switch which {
        case "sum":
        return sum
        case "average":
        return average
        default:
        return sum
    }
}
print("Operation(sum): \(operation(which: "sum"))")
print("Operation(average): \(operation(which: "average"))")
print("Operation(default): \(operation(which:))")

//Напишите функцию doOperation  (или сделайте перегрузку предыдущей функции) со следующим заголовком. Так же как в предыдущей функции она принимает строку содержащую операцию: “+” , “-“ , “/” , “*” и возвращает одну из четырех локальных (вложенных) функций от двух аргументов. Предусмотрите случай, когда введена не верная операция – в этом случае должно возвращаться nil.
func doOperation(operation: String) -> ((Double, Double) -> Double)? {
    switch operation {
        case "+": 
        return {
            (a: Double, b: Double) in a + b
        }
        case "-": 
        return {
            (a: Double, b: Double) in a - b
        }
        case "/": 
        return {
            (a: Double, b: Double) in a / b
        }
        case "*": 
        return {
            (a: Double, b: Double) in a * b
        }
        default: 
        return nil
    }
}
let selectOperation: ((Double, Double) -> Double)? = doOperation(operation: "+")
if let result = selectOperation?(1, 2) {
    print("doOperation: \(result)")
}

let task2 = "\ntask5.2"
print(task2)

//Напишите замыкание, которое будет сортировать  элементы массива по возрастанию и убыванию (используйте  метод sort). 
var numbers = [2, 0, 3, -1, -3, 1, -2]
numbers.sort(by: {$0 < $1})
print("Sort(asc): \(numbers)")
numbers.sort(by: {$0 > $1})
print("Sort(desc): \(numbers)")

//Напишите замыкание, которое будет отображать каждый элемент массива (в массиве могут быть nil) в строку, значение которой равно сумме цифр числа (если оно не nil).
let oneArray: [Int?] = [12, 3, 45, 6, nil, 77, 198, 55, 123456789]
let elemSum = oneArray.map {
    (elem) -> String in 
    var sum = 0 
    if let e = elem {
        for str in String(e) {
            sum += Int(String(str))!
        }
        return String(sum)
    }
    else {
        return "error"
    }
}
print("One array: \(elemSum)")

//Напишите замыкание, которое будет преобразовывать двумерный массив целых в одномерный
let twoDimensionalArray = [[1, 2, 3], [4, 5, 6]]
let arrayConvert = {
    (array: [[Int]]) -> [Int] in
    var result = [Int]()
    for subArr in array {
        for elem in subArr {
            result.append(elem)
        }
    }
    return result
}
let oneDimensionalArray = arrayConvert(twoDimensionalArray)
print("Two dimensional array: \(twoDimensionalArray)")
print("One dimensional array: \(oneDimensionalArray)")

//Используя  Reduce напишите замыкание, которое находит максимальный элемент массива
let reduceArray = [2, 0, 3, -1, -3, 1, -2].reduce(0) {
    (total, number) in max(total, number) 
}
print("Reduce(max elem in arr): \(reduceArray)")