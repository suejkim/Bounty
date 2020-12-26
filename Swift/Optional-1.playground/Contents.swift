import UIKit

// Optional 기능 4가지
// 1. Forced unwrapping
// 2. Optional binding (if let)
// 3. Optional binding (guard)
// 4. Nil coalescing




// 1. Forced unwrapping
var carName: String? = "red"
print(carName) // Optional("red")
print(carName!) // value 가져옴. red

carName = nil
//print(carName!) // Unexpectedly found nil while unwrapping an Optional value
// 값이 없는 경우 억지로 가지고 오려고 하면 error


// 2.Optional binding (if let)
if let unwrappedCarName = carName { // value가 있는 경우
    print(unwrappedCarName) // red
} else {
    print("carName 없음.")
}

// 이 방법은 Cyclomatic Complexity를 높일 수 있음
//func printParsedInt(from: String){
//    if let parsedInt = Int(from) {
//        print(parsedInt)
//    } else {
//        print("Int로 converting 되지 않음")
//    }
//}
//printParsedInt(from: "20") // 20
//printParsedInt(from: "20e") // Int로 converting 되지 않음


// 3. Optional binding (guard)
// 이 방법은 Cyclomatic Complexity를 낮출 수 있음
func printParsedInt(from: String){
    guard let parsedInt = Int(from) else {
        print("Int로 converting 되지 않음")
        return
    }
    print(parsedInt)
}
printParsedInt(from: "20e") // Int로 converting 되지 않음


// 4. Nil coalescing
var dogName: String? = nil
let myDogName: String = dogName ?? "초코"
print(myDogName) // 초코
