//
//  AstronomyPictureCell.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 02.09.2022.
//

import UIKit

class AstronomyPictureCell: UITableViewCell {
    
    static let identifier = "AstronomyCell"
    
    var viewModel: AstronomyPictureCellViewModelProtocol! {
        didSet {
            datelabel.text = viewModel.date
            titleLabel.text = viewModel.title
            
            viewModel.getImageData { imageData in
                self.astronomyImageView.image = UIImage(data: imageData)
            }
        }
    }
    
    // MARK: - Private properties
    
    private var backgroundCellView: UIView = {
        let backgroundCellView = UIView()
        
        backgroundCellView.backgroundColor = .secondarySystemGroupedBackground
        backgroundCellView.layer.cornerRadius = 15
        backgroundCellView.setupShadow(
            radius: 5,
            opacity: 0.5,
            offset: CGSize(width: 1, height: 1),
            darkModeColor: .white,
            lightModeColor: .black)
        
        return backgroundCellView
    }()
    
    private var datelabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.textAlignment = .right
        
        return dateLabel
    }()
    
    private var astronomyImageView: UIImageView = {
        let astronomyImageView = UIImageView()
        
        astronomyImageView.image = UIImage(systemName: "photo")
        astronomyImageView.contentMode = .scaleAspectFit
        
        return astronomyImageView
    }()
    
    private var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        
        return titleLabel
    }()
    
    private var videoIconImageView: UIImageView = {
        let videoIconImageView = UIImageView()
        
        videoIconImageView.image = UIImage(systemName: "play.rectangle")
        videoIconImageView.tintColor = .secondaryLabel
        
        return videoIconImageView
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup(subviews: datelabel, astronomyImageView, titleLabel, videoIconImageView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - TableView's methods
    
    override func prepareForReuse() {
        super.prepareForReuse()
        astronomyImageView.image = nil
        datelabel.text = nil
        titleLabel.text = nil
    }
}

// MARK: - Layout Methods

extension AstronomyPictureCell {
    
    private func setup(subviews: UIView...) {
        contentView.addSubview(backgroundCellView)
        subviews.forEach { subview in
            backgroundCellView.addSubview(subview)
        }
    }
    
    private func prapareViewsForSettingConstraints(_ views: UIView...) {
        views.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setConstraints() {
        prapareViewsForSettingConstraints(
            backgroundCellView,
            datelabel,
            astronomyImageView,
            titleLabel,
            videoIconImageView
        )
        
        NSLayoutConstraint.activate([
            backgroundCellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            backgroundCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            backgroundCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            backgroundCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            datelabel.topAnchor.constraint(equalTo: backgroundCellView.topAnchor, constant: 8),
            datelabel.leadingAnchor.constraint(equalTo: backgroundCellView.leadingAnchor, constant: 8),
            datelabel.trailingAnchor.constraint(equalTo: backgroundCellView.trailingAnchor, constant: -8),
            
            astronomyImageView.topAnchor.constraint(equalTo: datelabel.bottomAnchor, constant: 8),
            astronomyImageView.leadingAnchor.constraint(equalTo: backgroundCellView.leadingAnchor, constant: 8),
            astronomyImageView.trailingAnchor.constraint(equalTo: backgroundCellView.trailingAnchor, constant: -8),
            astronomyImageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: astronomyImageView.bottomAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: backgroundCellView.bottomAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(equalTo: backgroundCellView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: backgroundCellView.trailingAnchor, constant: -8),
            
            videoIconImageView.topAnchor.constraint(equalTo: backgroundCellView.topAnchor, constant: 8),
            videoIconImageView.bottomAnchor.constraint(equalTo: astronomyImageView.topAnchor, constant: -8),
            videoIconImageView.leadingAnchor.constraint(equalTo: backgroundCellView.leadingAnchor, constant: 8)
        ])
    }
}
