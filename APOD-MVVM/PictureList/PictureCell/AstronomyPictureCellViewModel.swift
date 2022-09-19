//
//  AstronomyPictureCellViewModel.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 02.09.2022.
//

import Foundation

protocol AstronomyPictureCellViewModelProtocol {
    
    var date: String { get }
    var title: String { get }
    
    var viewModelDidChange: ((AstronomyPictureCellViewModel) -> Void)? { get set }
    
    init(astronomyPicture: AstronomyPicture)
    
    func getImageData(completion: @escaping (Data) -> Void)
}

class AstronomyPictureCellViewModel: AstronomyPictureCellViewModelProtocol {
        
    var date: String {
        astronomyPicture.date ?? ""
    }
    
    var title: String {
        astronomyPicture.title ?? ""
    }
    
    var viewModelDidChange: ((AstronomyPictureCellViewModel) -> Void)?
    
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
