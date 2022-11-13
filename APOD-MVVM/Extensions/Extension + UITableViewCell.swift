//
//  Extension + UITableViewCell.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 12.11.2022.
//

import UIKit

extension UITableViewCell {
    
    func setupViewWithZeroMargins(_ view: UIView) {
        contentView.addSubview(view)
        setEqualConstraints(for: view)
    }
    
    private func setEqualConstraints(for view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
