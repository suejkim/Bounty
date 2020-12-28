import UIKit

// Struct
struct PersonStruct {
    var firstName: String
    var lastName: String

    // 생성자
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    mutating func uppercaseName(){
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}

// Class
class PersonClass {
    var firstName: String
    var lastName: String
    
    // 생성자
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    // class에서는 mutating 사용하지 않음
    func uppercaseName(){
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}

var personStruct1 = PersonStruct(firstName: "GilDong", lastName: "Hong")
var personStruct2 = personStruct1

var personClass1 = PersonClass(firstName: "Duli", lastName: "Hong")
var personClass2 = personClass1

personStruct2.lastName = "Go"
personStruct1.fullName // GilDong Hong
personStruct2.fullName // GilDong Go

personClass2.lastName = "Go"
personClass1.fullName // Duli Go
personClass2.fullName // Duli Go

// personClass2에 새롭게 할당
personClass2 = PersonClass(firstName: "New", lastName: "Class")
personClass1.fullName // Duli Go
personClass2.fullName // New Class
