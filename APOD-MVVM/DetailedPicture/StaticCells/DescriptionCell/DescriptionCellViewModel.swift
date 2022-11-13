//
//  DescriptionCellViewModel.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 13.11.2022.
//

import Foundation

// MARK: - Description Cell ViewModel Protocol

protocol DescriptionCellViewModelProtocol {
    
    var description: String { get }
    var viewModelDidChange: ((DescriptionCellViewModel) -> Void)? { get set }
    
    init(astronomyPicture: AstronomyPicture)
}

// MARK: - Description Cell ViewModel Class

class DescriptionCellViewModel: DescriptionCellViewModelProtocol {
    
    var description: String {
        astronomyPicture.explanation ?? ""
    }
    
    var viewModelDidChange: ((DescriptionCellViewModel) -> Void)?
    
    private let astronomyPicture: AstronomyPicture
    
    required init(astronomyPicture: AstronomyPicture) {
        self.astronomyPicture = astronomyPicture
    }
}
