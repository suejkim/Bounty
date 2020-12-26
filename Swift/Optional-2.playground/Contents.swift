import UIKit

// 1. 가장 좋아하는 음식을 담는 변수 작성 (String Optional)
let favoriteFood: String? = nil

// 2. Optional Binding (1)
if let foodName = favoriteFood {
    print(foodName)
} else {
    print("좋아하는 음식 없습니다.") // print
}

func checkFavoriteFood1(food: String?){
    if let favoriteFood = food {
        print(favoriteFood)
    } else {
        print("좋아하는 음식 없습니다.") // print
    }
}
checkFavoriteFood1(food: favoriteFood)

// 3. Optional Binding (2)
func checkFavoriteFood2(food: String?){
    guard let favoriteFood = food else {
        print("좋아하는 음식 없습니다.") // print
        return
    }
    print(favoriteFood)
}
checkFavoriteFood2(food: favoriteFood)

// 4. Nil coalescing
let food: String = favoriteFood ?? "아무거나 좋아합니다"
print(food) // 아무거나 좋아합니다

// 5. 닉네임을 받아서 출력하는 함수 만들기. 조건 입력 파라미터는 String Optional
func printNickName(nickName: String?){
    guard let myNickName = nickName else {
        print("닉네임을 만들어주세요") // print
        return
    }
    print(myNickName)
}
printNickName(nickName: nil)
