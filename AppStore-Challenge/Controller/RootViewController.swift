//
//  RootViewController.swift
//  AppStore-Challenge
//
//  Created by Hubert Wang on 25/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var navigateToAppStoreButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()
        self.setupElements()
    }
    
    // MARK: - Actions
    @IBAction func handleNavigationButtonTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Private methods
    private func setupNavigationBar() {
        self.navigateToAppStoreButton.clipsToBounds = true
        self.navigateToAppStoreButton.layer.cornerRadius = 10
    }
    
    private func setupElements() {
        
    }

}
