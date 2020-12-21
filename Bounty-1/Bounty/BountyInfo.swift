//
//  BountyInfo.swift
//  Bounty
//
//  Created by sjkim on 2020/12/18.
//

import UIKit

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

