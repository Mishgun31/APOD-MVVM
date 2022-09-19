//
//  PictureListViewController.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 30.08.2022.
//

import UIKit

class PictureListViewController: UITableViewController {
    
    private var viewModel: PictureListViewModelProtocol! {
        didSet {
            viewModel.getData {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        tableView = UITableView(frame: tableView.frame, style: .grouped)
        tableView.separatorStyle = .none
        tableView.register(
            AstronomyPictureCell.self,
            forCellReuseIdentifier: AstronomyPictureCell.identifier
        )
        
        viewModel = PictureListViewModel()
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
        present(SettingsViewController(), animated: true)
    }
}

// MARK: - TableView Data Source

extension PictureListViewController {
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: AstronomyPictureCell.identifier,
            for: indexPath
        ) as? AstronomyPictureCell else { return UITableViewCell() }
        
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        
        return cell
    }
}

