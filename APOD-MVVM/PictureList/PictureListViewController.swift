//
//  PictureListViewController.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 30.08.2022.
//

import UIKit

class PictureListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "Astronomy Pictures"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "slider.horizontal.3"),
            style: .plain,
            target: self,
            action: #selector(settingsButtonPressed)
        )
    }
    
    @objc func settingsButtonPressed() {
        
    }
}

