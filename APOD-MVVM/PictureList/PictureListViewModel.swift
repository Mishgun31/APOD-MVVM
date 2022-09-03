//
//  PictureListViewModel.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 01.09.2022.
//

import Foundation

protocol PictureListViewModelProtocol {
    
    var dailyPicture: AstronomyPicture? { get }
    var pictures: [AstronomyPicture] { get }
    
    func numberOfRows() -> Int
    func numberOfSections() -> Int
    func settingsButtonPressed()
}

class PictureListViewModel: PictureListViewModelProtocol {
    
    
    
    var dailyPicture: AstronomyPicture?
    var pictures: [AstronomyPicture] = []
    
    func numberOfRows() -> Int {
        return 1
    }
    
    func numberOfSections() -> Int {
        return 2
    }
    
    func settingsButtonPressed() {
        
    }
}
