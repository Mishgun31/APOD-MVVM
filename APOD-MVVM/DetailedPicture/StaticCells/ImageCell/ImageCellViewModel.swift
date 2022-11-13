//
//  ImageCellViewModel.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 13.11.2022.
//

import Foundation

// MARK: - Image Cell ViewModel Protocol

protocol ImageCellViewModelProtocol {
    
    var viewModelDidChange: ((ImageCellViewModel) -> Void)? { get set }
    
    init(astronomyPicture: AstronomyPicture)
    
    func getImageData(completion: @escaping (Data) -> Void)
}

// MARK: - Image Cell ViewModel Class

class ImageCellViewModel: ImageCellViewModelProtocol {
    
    var viewModelDidChange: ((ImageCellViewModel) -> Void)?
    
    private let astronomyPicture: AstronomyPicture
    
    required init(astronomyPicture: AstronomyPicture) {
        self.astronomyPicture = astronomyPicture
    }
    
    func getImageData(completion: @escaping (Data) -> Void) {
        Networker.shared.fetchImage(with: astronomyPicture.url ?? "") { imageData in
            completion(imageData)
        }
    }
}
