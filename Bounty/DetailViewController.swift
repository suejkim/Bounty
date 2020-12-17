//
//  DetailViewController.swift
//  Bounty
//
//  Created by sjkim on 2020/12/16.
//

import UIKit

class DetailViewController: UIViewController {

    // MVVM - 리팩토링
    
    // Model
    // - BountyInfo Object 생성
    
    // View
    // - imgView, nameLabel, bountyLabel
    // - 필요한 정보는 viewModel로부터 받기
    
    // ViewModel
    // - DetailViewModel 생성
    // - View layer에서 필요한 method 생성
    // - Model 가지고 있을 것
    
    
    // storyBoard와 연결
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!

    let viewModel = DetailViewModel()
    
    // DetailViewController가 메모리에 올라오기 직전에 호출됨
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        // 옵셔널 바인딩
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }
    
    // close action
    @IBAction func close(_ sender: Any) {
        // view controller 사라짐
        dismiss(animated: true, completion: nil) // completion : 이후에 일어날 동작
    }
    
}

class DetailViewModel {
    // model 가지고 있을 것
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
