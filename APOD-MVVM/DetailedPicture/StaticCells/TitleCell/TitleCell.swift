//
//  TitleCell.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 11.11.2022.
//

import UIKit

class TitleCell: UITableViewCell {
    
    static let identifier = "TitleCell"
    
    var viewModel: TitleCellViewModelProtcol! {
        didSet {
            titleLabel.text = viewModel.title
        }
    }
    
    // MARK: - Private properties
    
    private var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title1)
        
        return titleLabel
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewWithZeroMargins(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
