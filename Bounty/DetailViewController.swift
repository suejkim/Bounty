//
//  DetailViewController.swift
//  Bounty
//
//  Created by sjkim on 2020/12/16.
//

import UIKit

class DetailViewController: UIViewController {

    // storyBoard와 연결
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    var name: String?
    var bounty: Int?
    
    // DetailViewController가 메모리에 올라오기 직전에 호출됨
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        // 옵셔널 바인딩
        if let name = self.name,
           let bounty = self.bounty {
            let img = UIImage(named: "\(name).jpg");
            imgView.image = img
            nameLabel.text = name
            bountyLabel.text = "\(bounty)"
        }
    }
    
    // close action
    @IBAction func close(_ sender: Any) {
        // view controller 사라짐
        dismiss(animated: true, completion: nil) // completion : 이후에 일어날 동작
    }
    
}
