import UIKit

// URLSessionConfiguration
// URLSessionTask

let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)


var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")!
let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "지드래곤")// 한글 입력시 자동으로 인코딩 해준다.

urlComponents.queryItems?.append(mediaQuery)
urlComponents.queryItems?.append(entityQuery)
urlComponents.queryItems?.append(termQuery)

let requestURL = urlComponents.url!

// task
// target url
// response handler
let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
    guard error == nil else {return}
    
    guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {return}
    let successRange = 200..<300
    guard successRange.contains(statusCode) else {
        // handle response error
        return
    }
    guard let resultData = data else { return }
    let resultString = String(data: resultData, encoding: .utf8)
    
    struct Response: Codable { // Codable
        let resultCount: Int
        let tracks: [Track]
        
        enum CodingKeys: String, CodingKey {
            case resultCount
            case tracks = "results"
        }
    }
    
    struct Track: Codable { // Codable
        let title: String
        let artistName: String
        let thumbnailPath: String
    
        // 내가 정한 프로퍼티와 서버에서 받는 프로퍼티를 연결
        enum CodingKeys: String, CodingKey {
            case title = "trackName"
            case artistName
            case thumbnailPath = "artworkUrl30"
        }
    }
    
    // 파싱 및 트랙 가져오기
    do {
        let decoder = JSONDecoder()
        let response = try decoder.decode(Response.self, from: resultData) // try catch
        let tracks = response.tracks
        
        print("----> track: \(tracks.count) -\(tracks.last?.title), \(tracks.last?.thumbnailPath)")
        
        
    } catch let error {
        print("-----> error: \(error.localizedDescription)")
    }
    
//    print("---> result : \(resultString)")
}

dataTask.resume()
