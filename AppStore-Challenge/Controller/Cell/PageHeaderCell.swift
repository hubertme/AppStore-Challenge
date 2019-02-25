//
//  PageHeaderCell.swift
//  AppStore-Challenge
//
//  Created by Hubert Wang on 25/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class PageHeaderCell: UITableViewCell {
    
    // MARK: - Variables
    var parentVC: UIViewController?
    
    // MARK: - Cell's statics
    static var cellDescription: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: cellDescription, bundle: nil)
    }
    
    // MARK: - Outlets
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var developerLabel: UILabel!
    @IBOutlet weak var getButton: UIButton!
    @IBOutlet weak var appIconLabel: UIImageView!

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupElements()
    }
    
    public func parseData(parentVC: UIViewController) {
        self.parentVC = parentVC
    }
    
    // MARK: - Private methods()
    private func setupElements() {
        self.getButton.clipsToBounds = true
        self.getButton.layer.cornerRadius = self.getButton.frame.height/2
    }
    
}
