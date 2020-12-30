import UIKit

// 1. 인자없는 함수
func printName(){
    print("-----> Lovely")
}
printName()

// 2. 인자 1개인 함수
func printMulipleOfTen(value: Int){
    print("\(value) * 10 = \(value * 10)") // 10 * 10 = 100
}
printMulipleOfTen(value: 10)

// 3. 인자 2개인 함수
func printTotalPrice1(price: Int, count: Int){
    print("totalPrice : \(price) * \(count) = \(price * count) ")
        // totalPrice : 1000 * 2 = 2000
}
printTotalPrice1(price: 1000, count: 2)

// 4. external name 이용
// 인자 2개인 함수
func printTotalPrice(_ price: Int, _ count: Int){
        // external name(underscore) : 인자에서 보여지는 이름
    print("totalPrice : \(price) * \(count) = \(price * count) ")
}
printTotalPrice(2000, 2)

func printTotalPrice(가격 price: Int, 갯수 count: Int){
// external name(가격, 갯수) : 인자에서 보여지는 이름
    print("totalPrice : \(price) * \(count) = \(price * count) ")
}
printTotalPrice(가격: 5000, 갯수: 2)

// 5. 인자에 default 설정
func printTotalPrice2(price: Int = 1500, count: Int){
    print("totalPrice : \(price) * \(count) = \(price * count) ")
}
printTotalPrice2(count: 3) // totalPrice : 1500 * 3 = 4500
printTotalPrice2(price: 1000, count: 2) // default 가격과 다른 경우 직접 파라미터에 넣음
// totalPrice : 1000 * 2 = 2000

// 6. return
func totalPrice(price: Int, count: Int) -> Int {
    let totalPrice = price * count
    return totalPrice
}
let calculatedPrice = totalPrice(price: 1000, count: 45) // 45000


// 7. in-out parameter
// error! : 파라미터 넣는 순간 value에 copy된다. -> value는 constant로 값을 바꿀 수 없다
// error: left side of mutating operator isn't mutable: 'value' is a 'let' constant
//func increaseAndPrint(_ value: Int){
//    value += 1 // 바꿀 수 없는 constant인데 바꾸려고 해서 에러가 남 -> inout을 넣어 해결
//    print("value: \(value)")
//}
//increaseAndPrint(30)

var value = 2
func increaseAndPrint(_ value: inout Int){ // inout
    value += 1
    print("value: \(value)") // value: 3
}
increaseAndPrint(&value) // &

// 8. 함수를 파라미터로 받는 경우
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}

var function = add
function(2, 5) // 7
function = subtract
function(5, 2) // 3

func printResult (_ function: (Int, Int) -> Int, _ a: Int, _ b: Int){
    let result = function(a, b)
    print(result) // 7
}
printResult(add, 3, 4)
