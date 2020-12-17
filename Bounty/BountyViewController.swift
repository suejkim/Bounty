//
//  BountyViewController.swift
//  Bounty
//
//  Created by sjkim on 2020/12/14.
//

import UIKit

class BountyViewController: UIViewController,
                            UITableViewDataSource,
                            UITableViewDelegate{

    // MVVM - 리팩토링
    
    // Model
    // - BountyInfo Object 생성
    
    // View
    // - ListCell 필요한 정보들은 viewController가 아닌 ViewModel로부터 받기
    // - ListCell은 ViewModel로부터 받은 정보로 View update
    
    // ViewModel
    // - BountyViewModel 생성
    // - View layer에서 필요한 method 생성
    // - Model 가지고 있을 것
    
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
    // segue 수행하는 것을 준비
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController에게 데이터 전달.
        
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int { // 몇번째인지
                let bountyInfo = bountyInfoList[index]
                vc?.bountyInfo = bountyInfo
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // UITableViewDataSource
    
    // 리턴할 데이터 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyInfoList.count
    }
    
    // indexPath: cell의 위치
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        let bountyInfo = bountyInfoList[indexPath.row]
        cell.imgView.image = bountyInfo.image
        cell.nameLabel.text = bountyInfo.name
        cell.bountyLabel.text = "\(bountyInfo.bounty)"
    
        return cell
    }
    
    
    // UITableViewDelegate
    // 클릭시 일어날 일
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        
        // 이후 segue 수행할 것. segue : 스토리 보드에서 두 view Controller 간에 연결을 시킬 때 segue 사용
        // 여러개의 segue 중 구분자 withIdentifier
        // 특정 object 끼워서 보냄 sender
        performSegue(withIdentifier: "showDetail", sender: indexPath.row) // sender : cell에 대한 정보
    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}

struct BountyInfo {
    let name: String
    let bounty: Int
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}
