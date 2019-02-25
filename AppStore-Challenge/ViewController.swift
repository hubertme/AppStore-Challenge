//
//  ViewController.swift
//  AppStore-Challenge
//
//  Created by Hubert Wang on 25/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var contentTableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()
        self.setupElements()
    }
    
    // MARK: - Private methods
    private func setupElements() {
//        self.contentTableView.tableFooterView = UIView()
    }
    
    private func setupNavigationBar() {
        
    }
    
}

