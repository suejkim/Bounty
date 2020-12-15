//
//  DetailViewController.swift
//  Bounty
//
//  Created by sjkim on 2020/12/16.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // close action
    @IBAction func close(_ sender: Any) {
        // view controller 사라짐
        dismiss(animated: true, completion: nil) // completion : 이후에 일어날 동작
    }
    
}
