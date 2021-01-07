import UIKit

struct Person {
    
    
    // stored property(인스턴스 프로퍼티) 저장된 값
    // computed property(인스턴스 프로퍼티) 저장된 값을 가공해서 이용. getter setter
    // type property 생성된 인스턴스와 상관없이 타입 자체의 속성을 정함
    // lazy property (최적화) 해당 프로퍼티에만 접근
    
    
    // stored property
    var firstName: String {
        // 값 변경되는 시점을 알아차릴 때. willSet, didSet은 stored property에서만 가능
        willSet {
            print(" willSet : \(firstName) -> \(newValue)") // willSet : SJ -> YN
        }
        didSet {
            print(" didSet : \(oldValue) -> \(firstName)") // didSet : SJ -> YN
        }
    }

    // stored property
    var lastName: String
    
    // lazy property. 모든 사용자가 접근할 필요없는 프로퍼티. (cost가 많이 드는 경우)
    lazy var isPopular: Bool = {
        if firstName == "YN" {
            return true
        } else {
            return false
        }
    }()
    
    // computed property
    var fullName : String {
        get { // getter
            return "\(firstName) \(lastName)"
        }
        set { // setter
            let name = newValue.components(separatedBy: " ") // ["YN", "Kim"]
            
            if let firstName = name.first {
                self.firstName = firstName
            }
            
            if let lastName = name.last {
                self.lastName = lastName
            }
        }
    }
    
    // type property
    static let isAlien: Bool = false
}

var person = Person(firstName: "SJ", lastName: "Kim")
person.lastName = "Lee"
person.firstName // "SJ"
person.lastName // "Lee"
person.fullName // "SJ Lee"

person.fullName = "YN Kim"
person.fullName // "YN Kim"

Person.isAlien  // false

person.isPopular // true
