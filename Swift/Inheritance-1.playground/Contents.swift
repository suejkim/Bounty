import UIKit

struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func printMyName() {
        print("My name is \(firstName) \(lastName)")
    }
}

// Person 상속 받기
class Student: Person {
    var grades: [Grade] = []
}

// 학생은 사람이다 -> o
let gilDong = Person(firstName: "GilDong", lastName: "Go")
let duli = Student(firstName: "Duli", lastName: "Go") // Student도 생성자로 생성 가능
// person property 접근 가능
gilDong.firstName
duli.firstName
// person method 접근 가능
gilDong.printMyName() // My name is GilDong Go
duli.printMyName() // My name is Duli Go

let math = Grade(letter: "B", points: 8.9, credits: 3)
let history = Grade(letter: "A", points: 10.0, credits: 3)
duli.grades.append(math)
duli.grades.append(history)
// student만 grades property 접근 가능
duli.grades
//gilDong.grades // error: value of type 'Person' has no member 'grades'


// 상속의 깊이 추가

// 학생인데 운동선수
class StudentAthelete: Student {
    var minimumTrainingTime = 2
    var trainedTime = 0
    func train() {
        trainedTime += 1
    }
}

// 운동선수인데 축구선수
class FootballPlayer: StudentAthelete {
    var footballTeam = "FC Swift"
    
    // 운동시간 변경 : override
    override func train() {
        trainedTime += 2
    }
}

// 상속이 깊어짐
// Person > Student > StudentAthelete > FootballPlayer

var athelete1 = StudentAthelete(firstName: "Yuna", lastName: "Kim")
var athelete2 = FootballPlayer(firstName: "Heong", lastName: "Son")

athelete1.firstName
athelete2.lastName

athelete1.grades.append(math)
athelete2.grades.append(history)
athelete1.train()
athelete1.trainedTime // 1
athelete2.train()
athelete2.trainedTime // 2

athelete1 = athelete2 as StudentAthelete // 업캐스팅
athelete1.train()
athelete1.trainedTime // 4
//athelete1.footballTeam // StudentAthelete 프로퍼티만 접근가능
// error. value of type 'StudentAthelete' has no member 'footballTeam'

if let son = athelete1 as? FootballPlayer { // 업캐스팅 된 athelete1을 다운캐스팅
    print("\(son.footballTeam)") // FC Swift
}
