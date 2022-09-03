//
//  AstronomyPictureViewModel.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 02.09.2022.
//

import Foundation

protocol AstronomyPictureViewModelProtocol {
    
    init(astronomyPicture: AstronomyPicture)
}

class AstronomyPictureViewModel: AstronomyPictureViewModelProtocol {
    
    let astronomyPicture: AstronomyPicture
    
    required init(astronomyPicture: AstronomyPicture) {
        self.astronomyPicture = astronomyPicture
    }
}
