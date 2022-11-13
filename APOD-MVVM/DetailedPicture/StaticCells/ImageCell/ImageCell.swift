//
//  ImageCell.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 13.11.2022.
//

import UIKit

class ImageCell: UITableViewCell {
    
    static let identifier = "ImageCell"
    
    var viewModel: ImageCellViewModelProtocol! {
        didSet {
            viewModel.getImageData { imageData in
                self.image.image = UIImage(data: imageData)
            }
        }
    }
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.setupShadow(
            radius: 5,
            opacity: 0.5,
            offset: CGSize(width: 1, height: 1),
            darkModeColor: .white,
            lightModeColor: .black
        )
        
        return image
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewWithZeroMargins(image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
