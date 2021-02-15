//
//  TableViewCell.swift
//  PerfumeStore
//
//  Created by Акнур on 1/25/21.
//  Copyright © 2021 Акнур. All rights reserved.
//

import UIKit
import Kingfisher

class PerfumeTableViewCell: UITableViewCell {
    //MARK: - Variables
    var movieTitleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    var movieImages: UIImageView = {
        let img = UIImageView()
        return img
        
    }()
    
    //MARK: - Lifecycle
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupSubviews()
    }
    //MARK: - Setup
    
    fileprivate func setupSubviews(){
        addSubview(movieTitleLabel)
        movieTitleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 5), size: .init(width: 40, height: 50))
        movieTitleLabel.addSubview(movieImages)
        movieImages.anchor(top: movieTitleLabel.topAnchor, leading: nil, bottom: nil, trailing: movieTitleLabel.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 60, height: 50))
        self.movieImages.contentMode = .scaleAspectFit
    }
    
    func getData(_ data: Results) {
        self.movieTitleLabel.text = data.title!
    }
}


