//
//  DetailedPictureViewModel.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 26.10.2022.
//

import Foundation

// MARK: - Detailed Picture ViewModel Protocol

protocol DetailedPictureViewModelProtocol {
    
    var astronomyPicture: AstronomyPicture { get }
    
    init(astronomyPicture: AstronomyPicture)
    
    func numberOfRows() -> Int
    func titleCellViewModel() -> TitleCellViewModelProtcol
    func imageCellViewModel() -> ImageCellViewModelProtocol
    func descriptionCellViewModel() -> DescriptionCellViewModelProtocol
}

// MARK: - Detailed Picture ViewModel Class

class DetailedPictureViewModel: DetailedPictureViewModelProtocol {
    
    var astronomyPicture: AstronomyPicture
    
    required init(astronomyPicture: AstronomyPicture) {
        self.astronomyPicture = astronomyPicture
    }
    
    func numberOfRows() -> Int {
        return 3
    }
    
    func titleCellViewModel() -> TitleCellViewModelProtcol {
        TitleCellViewModel(astronomyPicture: astronomyPicture)
    }
    
    func imageCellViewModel() -> ImageCellViewModelProtocol {
        ImageCellViewModel(astronomyPicture: astronomyPicture)
    }
    
    func descriptionCellViewModel() -> DescriptionCellViewModelProtocol {
        DescriptionCellViewModel(astronomyPicture: astronomyPicture)
    }
}
