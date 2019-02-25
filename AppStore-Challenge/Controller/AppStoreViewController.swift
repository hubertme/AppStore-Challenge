//
//  ViewController.swift
//  AppStore-Challenge
//
//  Created by Hubert Wang on 25/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class AppStoreViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var contentTableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupElements()
    }
    
    // MARK: - Private methods
    private func setupElements() {
//        self.contentTableView.tableFooterView = UIView()
        self.contentTableView.delegate = self
        self.contentTableView.dataSource = self
        
        self.contentTableView.register(PageHeaderCell.nib, forCellReuseIdentifier: PageHeaderCell.cellDescription)
    }
    
}

// MARK: - Extension
extension AppStoreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let headerCell = self.contentTableView.dequeueReusableCell(withIdentifier: PageHeaderCell.cellDescription, for: indexPath) as! PageHeaderCell
        headerCell.parseData(parentVC: self)
        
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let headerCell = self.contentTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! PageHeaderCell
        guard let getButton = headerCell.getButton else {return}
        let buttonSuperPosition = self.contentTableView.convert(getButton.frame, to: self.view)
        
        if buttonSuperPosition.origin.y < (self.navigationController?.navigationBar.frame.height)! + getButton.frame.height*1.5 {
            
            // Icon image
            let iconImage = headerCell.appIconImageView.image
            let iconImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
            iconImageView.translatesAutoresizingMaskIntoConstraints = false
            iconImageView.image = iconImage
            iconImageView.clipsToBounds = true
            iconImageView.layer.cornerRadius = 6
            self.navigationItem.titleView = iconImageView
            
            [iconImageView.widthAnchor.constraint(equalToConstant: 35),
             iconImageView.heightAnchor.constraint(equalToConstant: 35)].forEach({$0.isActive = true})
            
            // Right button
            let rightGetButton = UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
            rightGetButton.setTitle("GET", for: .normal)
            rightGetButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            rightGetButton.backgroundColor = getButton.backgroundColor
            rightGetButton.clipsToBounds = true
            rightGetButton.layer.cornerRadius = rightGetButton.frame.height/2
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightGetButton)
            
            UIView.animate(withDuration: 0.2) {
                headerCell.getButton.alpha = 0
                headerCell.appIconImageView.alpha = 0
            }
        } else {
            self.navigationItem.rightBarButtonItem = nil
            self.navigationItem.titleView = nil
            
            UIView.animate(withDuration: 0.2) {
                headerCell.getButton.alpha = 1
                headerCell.appIconImageView.alpha = 1
            }
        }
    }
}

