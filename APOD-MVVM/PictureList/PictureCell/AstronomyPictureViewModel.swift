//
//  AstronomyPictureViewModel.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 02.09.2022.
//

import Foundation

protocol AstronomyPictureViewModelProtocol {
    
    var imageData: Data { get }
    var date: String { get }
    var title: String { get }
    
    init(astronomyPicture: AstronomyPicture)
}

class AstronomyPictureViewModel: AstronomyPictureViewModelProtocol {
    
    var imageData: Data {
        fetchImageData()
    }
    
    var date: String {
        astronomyPicture.date ?? ""
    }
    
    var title: String {
        astronomyPicture.title ?? ""
    }
    
    private let astronomyPicture: AstronomyPicture
    
    required init(astronomyPicture: AstronomyPicture) {
        self.astronomyPicture = astronomyPicture
    }
    
    private func fetchImageData() -> Data {
        var imageData = Data()
        Networker.shared.fetchImage(with: astronomyPicture.url ?? "") { data in
            imageData = data
        }
        return imageData
    }
}
