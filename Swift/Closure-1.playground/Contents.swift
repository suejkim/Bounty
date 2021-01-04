import UIKit

// 두 개의 수를 받아서 곱할 때
//var multiplyClosure: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
//    return a * b
//}

//var multiplyClosure: (Int, Int) -> Int = { (a, b) -> Int in
//    return a * b
//}

//var multiplyClosure: (Int, Int) -> Int = { (a, b) in
//    return a * b
//}

// 주로 사용되는 방법
//var multiplyClosure: (Int, Int) -> Int = { a, b in
//    return a * b
//}


// 인덱스 사용. 구현부가 긴 것을 줄일 수 있다.
var multiplyClosure: (Int, Int) -> Int = { $0 * $1 }
let result = multiplyClosure(4, 2) // 8

// 파라미터로 closure 받는 경우
func operateTwoNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    return result
}
operateTwoNum(a: 4, b: 2, operation: multiplyClosure) // 8

var addClosure: (Int, Int) -> Int = { (a, b) in
    return a + b
}
operateTwoNum(a: 4, b: 2, operation: addClosure) // 6

operateTwoNum(a: 4, b: 2) { a, b in
    return a / b // 2
}

// input, output 없음
let voidClosure: () -> Void = {
    print("input, output 없음")
}
voidClosure()

// capturing values
if true { // 바깥쪽 scope
    let numOutside = 3
    
    if true { // 안쪽 scope
        let numInside = 5
        print(numOutside, numInside)
    }
    
//    print(numOutside, numInside) // error. numInside 접근 안 됨
}

var count = 0
let incrementer = { // 클로저가 count를 캡쳐함
    count += 1
}
incrementer()
incrementer()
incrementer()
incrementer()

print(count) // 4
