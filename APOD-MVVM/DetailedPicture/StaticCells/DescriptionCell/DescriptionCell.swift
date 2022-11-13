//
//  DescriptionCell.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 13.11.2022.
//

import UIKit

class DescriptionCell: UITableViewCell {

    static let identifier = "DescriptionCell"
    
    var viewModel: DescriptionCellViewModelProtocol! {
        didSet {
            descriptionLabel.text = viewModel.description
        }
    }
    
    private var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        
        return descriptionLabel
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewWithZeroMargins(descriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
