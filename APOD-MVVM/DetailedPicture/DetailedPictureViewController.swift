//
//  DetailedPictureViewController.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 26.10.2022.
//

import UIKit

class DetailedPictureViewController: UITableViewController {
    
    var viewModel: DetailedPictureViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        title = nil
        
        tableView = UITableView(frame: tableView.frame, style: .grouped)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
        
        tableView.estimatedRowHeight = 300
        tableView.sectionHeaderHeight = 0
        
        tableView.separatorStyle = .none
        
        tableView.register(TitleCell.self, forCellReuseIdentifier: TitleCell.identifier)
        tableView.register(ImageCell.self, forCellReuseIdentifier: ImageCell.identifier)
        tableView.register(DescriptionCell.self, forCellReuseIdentifier: DescriptionCell.identifier)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {

        viewModel.numberOfRows()
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TitleCell.identifier,
                for: indexPath
            ) as? TitleCell else { return UITableViewCell() }
            
            cell.viewModel = viewModel.titleCellViewModel()
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ImageCell.identifier,
                for: indexPath
            ) as? ImageCell else { return UITableViewCell() }
            
            cell.viewModel = viewModel.imageCellViewModel()
            return cell
            
        default:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DescriptionCell.identifier,
                for: indexPath
            ) as? DescriptionCell else { return UITableViewCell() }
            
            cell.viewModel = viewModel.descriptionCellViewModel()
            return cell
        }
    }
}
