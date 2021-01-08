import UIKit

// Quiz
// 1. 강의 이름, 강사 이름, 학생 수를 가지는 Struct 만들기 (Lecture)
struct Lecture: CustomStringConvertible { // CustomStringConvertible : protocol
    var description: String {
        return "강의이름 : \(lectureName), 강사이름 : \(teacherName)"
    }
    
    var lectureName: String
    var teacherName: String
    var studentCnt: Int
        
//    init(lectureName: String, teacherName: String, studentCnt: Int){
//        self.lectureName = lectureName
//        self.teacherName = teacherName
//        self.studentCnt = studentCnt
//    }
}

// 2. 강의 array와 강사 이름을 받아서 해당 강사의 강의 이름을 출력하는 함수 만들기
func printLecture(lectures: [Lecture], teacherName: String){
//    var lectureName = ""
//    for lecture in lectures {
//        if lecture.teacherName == teacherName {
//            lectureName = lecture.lectureName
////            break
//        }
//    }
    
    // Closure 이용. 어렵다
    let lectureName = lectures.first(where: { (lecture) -> Bool in
        lecture.teacherName == teacherName
    })?.lectureName ?? ""
    
    print(lectureName)
}


// 3. 강의 3개 만들고 강사 이름으로 강의 찾기
let javaClass = Lecture(lectureName: "java", teacherName: "이자바선생님", studentCnt: 10)
let iOSClass = Lecture(lectureName: "iOS", teacherName: "iOS선생님", studentCnt: 20)
let sqlClass = Lecture(lectureName: "SQL", teacherName: "오라클선생님", studentCnt: 30)
let lectureArray:[Lecture] = [javaClass, iOSClass, sqlClass]
printLecture(lectures: lectureArray, teacherName: "이자바선생님") // java

javaClass // 강의이름 : java, 강사이름 : 이자바선생님
