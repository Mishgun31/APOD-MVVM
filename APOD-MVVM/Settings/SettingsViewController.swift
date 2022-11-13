//
//  SettingsViewController.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 02.09.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        view.backgroundColor = .systemBackground
    }
    
    private func setupNavigationBar() {
        title = "Settings"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "questionmark.circle"),
            style: .plain,
            target: self,
            action: #selector(helpButtonPressed)
        )
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(cancelButtonPressed)
        )
    }
    
    @objc private func helpButtonPressed() {
        
    }
    
    @objc private func cancelButtonPressed() {
        dismiss(animated: true)
    }
}
