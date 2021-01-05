import UIKit

/*
 function처럼 기능을 수행하는 code block의 특별한 타입
 함수는 closure의 한가지 타입
 - 자주 쓰이는 형태
    - 어떤 task가 완료되었을 때 closure가 수행되어 자주 쓰임
    - 비동기적으로. 해당일이 끝나고 뭔가 수행해야할 때 closure 수행
    - 네트워크 통해 데이터 받는 게 완료된 후 데이터를 뿌려주는 코드블럭 수행시킬 때 주로 사용
 */


// Ex1. 아주 간단한 Simple Closure
let simpleClosure1 = {

}
simpleClosure1()

// Ex2. 코드블록을 구현한 Closure
let simpleClosure2 = {
    print("hello")
}
simpleClosure2()

// Ex3. input 파라미터를 받는 Closure
// () 대신 Void 사용가능
let simpleClosure3: (String) -> Void = { name in
    print("hello \(name)")
}
simpleClosure3("초코")

// Ex4. 값을 리턴하는 Closure
let simpleClosure4: (String) -> String = { name in
    let message = "\(name)님 안녕하세요."
    return message
}
simpleClosure4("초코")

// Ex5. Closure를 파라미터로 받는 함수 구현
func someSimpleFunction1(simpleClosure: () -> Void){
    print("함수에서 호출이 됨") // 1
    simpleClosure()
}
someSimpleFunction1(simpleClosure: {
    print("simpleClosure") // 2
})

// Ex6. Trailing Closure : 인자가 여러개 있을 때, 마지막 인자가 클로저일 때. 코드를 생략할 수 있음
func someSimpleFunction2(message: String, simpleClosure: () -> Void){
    print("함수에서 호출이 됨. 메시지는 \(message)") // 1 함수에서 호출이 됨. 메시지는 안녕하세요.
    simpleClosure()
}
someSimpleFunction2(message: "안녕하세요.", simpleClosure: {
    print("simpleClosure") // 2 simpleClosure
})
someSimpleFunction2(message: "안녕하세요.") {
    print("simpleClosure")
}

/*
 함수에서 호출이 됨. 메시지는 안녕하세요.
 simpleClosure
 함수에서 호출이 됨. 메시지는 안녕하세요.
 simpleClosure
 */
