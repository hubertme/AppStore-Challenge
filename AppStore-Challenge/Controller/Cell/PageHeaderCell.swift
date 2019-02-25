//
//  PageHeaderCell.swift
//  AppStore-Challenge
//
//  Created by Hubert Wang on 25/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class PageHeaderCell: UITableViewCell {
    
    // MARK: - Cell's statics
    static var cellDescription: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: cellDescription, bundle: nil)
    }

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
