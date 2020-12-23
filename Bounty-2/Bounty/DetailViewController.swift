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
    // animation
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    
    let viewModel = DetailViewModel()
    
    // DetailViewController가 메모리에 올라오기 직전에 호출됨
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // animation 준비. 기본 세팅
        prepareAnimation()
    }
    
    // view 보이고 나서. animation
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    // 화면 밖에서 label들 대기
    private func prepareAnimation(){
//        (1) layoutConstraint 이용
//        nameLabelCenterX.constant = view.bounds.width
//        bountyLabelCenterX.constant = view.bounds.width
        
        // (2) view 속성 이용해서 animating.
        // 변형. 우측에서 3배 커지고 180도 돌아가있는 상태
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        nameLabel.alpha = 0
        bountyLabel.alpha = 0
    }
    
    private func showAnimation(){
//     (1) layoutConstraint 이용
//        nameLabelCenterX.constant = 0
//        bountyLabelCenterX.constant = 0
//
////        UIView.animate(withDuration: 0.3) { // 0.3초
////            self.view.layoutIfNeeded()
////        }
//
////        UIView.animate(withDuration: 0.3,
////                       delay: 0.1,
////                       options: .curveEaseIn,
////                       animations: {self.view.layoutIfNeeded()},
////                       completion: nil)
//
//        // labels
//        UIView.animate(withDuration: 0.3,
//                       delay: 0.2,
//                       usingSpringWithDamping: 0.6,
//                       initialSpringVelocity: 2,
//                       options: .allowUserInteraction,
//                       animations: {self.view.layoutIfNeeded()},
//                       completion: nil)
//
//        // image
//        UIView.transition(with: imgView,
//                          duration: 0.3,
//                          options: .transitionFlipFromLeft,
//                          animations: nil,
//                          completion: nil)
        
//     (2) view 속성 이용해서 animating.
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 2,
                       options: .allowUserInteraction,
                       animations: {
                        // 변형 전의 모습
                        self.nameLabel.transform = CGAffineTransform.identity
                        self.nameLabel.alpha = 1                       },
                       completion: nil)
      
        UIView.animate(withDuration: 1,
                       delay: 0.3,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 2,
                       options: .allowUserInteraction,
                       animations: {
                        // 변형 전의 모습
                        self.bountyLabel.transform = CGAffineTransform.identity
                        self.bountyLabel.alpha = 1
                       },
                       completion: nil)
        
        UIView.transition(with: imgView,
                          duration: 0.3,
                          options: .transitionFlipFromLeft,
                          animations: nil,
                          completion: nil)
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
