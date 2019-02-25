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
        let getButton = headerCell.getButton
        let buttonSuperPosition = self.contentTableView.convert(getButton!.frame, to: self.view)
        
        if buttonSuperPosition.origin.y < (self.navigationController?.navigationBar.frame.height)! + getButton!.frame.height {
            print("Button is getting high!")
        }
    }
}

