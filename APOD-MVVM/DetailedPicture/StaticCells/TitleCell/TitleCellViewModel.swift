//
//  TitleCellViewModel.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 11.11.2022.
//

import Foundation

// MARK: - Title Cell ViewModel Protocol

protocol TitleCellViewModelProtcol {
    
    var title: String { get }
    var viewModelDidChange: ((TitleCellViewModel) -> Void)? { get set }
    
    init(astronomyPicture: AstronomyPicture)
}

// MARK: - Title Cell ViewModel Class

class TitleCellViewModel: TitleCellViewModelProtcol {
    
    var title: String {
        astronomyPicture.title ?? ""
    }
    
    var viewModelDidChange: ((TitleCellViewModel) -> Void)?
    
    private let astronomyPicture: AstronomyPicture
    
    required init(astronomyPicture: AstronomyPicture) {
        self.astronomyPicture = astronomyPicture
    }
}
