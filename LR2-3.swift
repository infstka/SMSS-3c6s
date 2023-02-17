let n = "\n"
/*
1)Определите несколько переменных с let и var с явным указанием типа и без (Int, Double, String, Float, Bool)
2)Выведите значения на консоль.
3)В строках добавьте выражения или числовые переменные объявленные ранее.
*/
let task1 = "task2.1"
let a = 1
var b = 2
let c : Double = 3.0
var d : String = "four"
print(task1)
print(a, b, c, d, n)

/*
1)Создайте числовые литералы для числа 5 в двоичном, десятичном и шестнадцатеричном представлении. 
2)Создайте литерал для числа 0.36 в экспоненциальной форме. 
3)Используйте дополнительное форматирование для числа 12305670.9805
*/
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

/*
1)	Создайте псевдоним типа String с именем Text . 
2)	Объявите три константы типа Text . Значения двух констант должны состоять только из цифр, третьей — из цифр и букв . 
3)	Из всех трех констант найдите те, которые состоят только из цифр, и выведите их на консоль .
*/
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
/*
4)	Создайте кортеж (2019, FIT, 4). 
5)	Задайте имена элементам кортежа.  
6)	Выведите элементы двумя способами -  по индексу, по имени.
7)	Измените значения элемента кортежа
8)	Запишите каждый элемент кортежа в три константы
9)	Создайте второй кортеж, аналогичный первому по параметрам. Обменяйте значения в кортежах между собой. 
*/
var tuple = (year: 2023, faculty: "FIT", course: 3)
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

/*
1)	Создайте две строки с числовым значением и без. 
2)	Выполните ее преобразование к опциональному Int.  
3)	Объявите  переменную типа Int?
4)	Присвойте ей состояние – без значения
*/
let task4 = "task2.4"
let withNumber = "123"
let withoutNumber = "abc"
var optInt: Int? = Int(withNumber)

print(task4)
print("Optional Int: \(optInt!)\n")

/*
1)	Создайте опциональную связку.  
*/
let task5 = "task2.5"
print(task5)
if let num = optInt {
    print("Integer \(optInt!) is not string and it is a number: \(num)")
} 
else {
    print("Integer \(optInt!) is string")
}

/*
1)	Используя оператор = выполните присваивание кортежу (yaer, specialty, gruope).
2)	Задайте переменной name значение используя оператор объединения по нулевому указателю. Значение по умолчанию «noname».
*/
let task6 = "\ntask2.6"
let(year2, speciality, group) = (2023, "POIBMS", 7)
let defaultName = "noname"
var userName: String? = "name" // по умолчанию равно nil
var nameToUse = userName ?? defaultName

print(task6)
print(year2, speciality, group)
print(nameToUse)

/*
1)	Задайте массив строк с названиями зимних месяцев и выведите его используя оператор закрытого и полузакрытого диапазона.
*/
let task7 = "\ntask2.7"
let months = ["December", "January", "February"]
let count = months.count

print(task7)
for i in 0..<count { //полузакр (закрытый 0...1)
 print("Month \(i + 1) is called \(months[i])")
}

/*
1)	Используя интерполяцию задайте строку содержащую константу, переменную и выражение.
2)	Запишите строковый литерал со специальным символом
*/
let task8 = "\ntask2.8"
let one = 1
var two = 2
let result = "\(one) multiply \(two) is \(Double(one) * Double(two))"
let dollarSign = "\u{24}\n" 
print(task8)
print(result)
print(dollarSign)

/*
1)	Определите псевдоним Operation типу кортежа, содержащему три элемента со следующими именами: operandOne, operandTwo, operation. Первые два — это числа с плавающей точкой . Они будут содержать операнды для выполняемой операции. Третий элемент — строковое значение типа Character. Оно будет содержать указатель на проводимую операцию. Всего может быть четыре вида операций: +, -, *, /. 
2)	Создайте константу типа Operation и заполните значения ее элементов произвольным образом, например (3.1, 33, "+") . 
3)	Используя конструкцию switch-case, вычислите значение операции, указанной в элементе operation созданного кортежа для операндов в его первых двух элементах . Оператор switch должен корректно обрабатывать любую из перечисленных операций. 
4)	В созданной константе замените символ операции другим произвольным символом и проверьте правильность работы конструкции switch-case .
*/
let task9 = "task2.9"
print(task9)
typealias Operation = (operandOne: Double, operandTwo: Double, operation: Character) 
let someOperation: Operation = (1.23, 4, "+") //выведет unknown operation
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

/*
1)	Задайте массив целых. Выведите его значения используя for-in,  
Подсчитайте сумму элементов по while  и repeat  с диапазоном, с шагом, в обратном порядке.
2)	Продемонстрируйте работу оператора guard
*/
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