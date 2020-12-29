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

class Student: Person {
    var grades: [Grade] = []
    
    // designated initialization
    override init(firstName: String, lastName: String) {
        super.init(firstName: firstName, lastName: lastName)
    }
    
    // convenience initialization
    convenience init(student: Student){
        self.init(firstName: student.firstName, lastName: student.lastName)
    }
}

// 학생인데 운동선수
class StudentAthlete: Student {
    var minimumTrainingTime: Int = 2
    var trainedTime: Int = 0
    var sports: [String]
    
    // 인스턴스 생성 시점에 모든 stored property를 initialize 해줘야한다.
    init(firstName: String, lastName: String, sports: [String]) {
        
        // 2-phase Initialization(규칙)
        // 프로퍼티 initialize한 뒤에
        
        // phase 1
        // phase 1에서 프로퍼티 세팅을 완료해야함
        self.sports = sports // 자식 프로퍼티 먼저 세팅
//        self.train() // 규칙 어기고 여기에 들어가면 안됨
        super.init(firstName: firstName, lastName: lastName) // Person의 init
        // 부모 프로퍼티. 이후에 세팅
        
        // phase 2
        // 프로퍼티 세팅을 완료해야 메소드에 접근하거나 세팅이 완료된 프로퍼티에 접근할 수 있다.
        self.train()
    }
    
    // initialize가 커지는 경우에. 축소시키고 간편하게
    convenience init(name: String){
        self.init(firstName: name, lastName: "", sports: [])
    }
    
    func train() {
        trainedTime += 1
    }
}

// 운동선수인데 축구선수
class FootballPlayer: StudentAthlete {
    var footballTeam = "FC Swift"

    override func train() {
        trainedTime += 2
    }
}

let student1 = Student(firstName: "a", lastName: "b")
let student1_1 = Student(student: student1) // 예를 들어 서울에서 부산으로 전학을 간 경우
student1_1.printMyName() // My name is a b
let student2 = StudentAthlete(firstName: "c", lastName: "d", sports: ["football"])
let student3 = StudentAthlete(name: "e")
student3.printMyName() // My name is e
student3.sports // []
