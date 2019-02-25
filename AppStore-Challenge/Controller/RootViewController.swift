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
        self.performSegue(withIdentifier: NavigationDestinationEnum.appStoreVC.rawValue, sender: self)
    }
    
    // MARK: - Private methods
    private func setupElements() {
        self.navigateToAppStoreButton.clipsToBounds = true
        self.navigateToAppStoreButton.layer.cornerRadius = 10
    }
    
    private func setupNavigationBar() {
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

}
