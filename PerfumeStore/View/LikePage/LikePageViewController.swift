//
//  LikePageViewController.swift
//  PerfumeStore
//
//  Created by Акнур on 1/23/21.
//  Copyright © 2021 Акнур. All rights reserved.
//

import UIKit
struct saveData {
    static let title = ""
}
class LikePageViewController: UIViewController {
    var data: Results?
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.backgroundColor = .white
        label.layer.cornerRadius = 40
           return label
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .pinkColor()
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 150, left: 20, bottom: 0, right: 20), size: .init(width: 180, height: 150))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
