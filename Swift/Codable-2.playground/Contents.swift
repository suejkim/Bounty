import UIKit

struct Person: Codable{
    var name: String
    var age: Int
}

// encode
let lovelySjkim = Person(name: "sjkim", age: 20)
let encodedData = try? JSONEncoder().encode(lovelySjkim)
// convert to JSON (if)
if let jsonString = String(data: encodedData!, encoding: .utf8) {
    print(jsonString)
}


// decode
let jsonString = """
                    {"name":"sjkim","age":20}
                 """
let stringData = jsonString.data(using: .utf8)!
if let decodedData = try? JSONDecoder().decode(Person.self, from: stringData){
    print(decodedData.age)
    print(decodedData.name)
}
