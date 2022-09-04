//
//  PictureListViewModel.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 01.09.2022.
//

import Foundation

protocol PictureListViewModelProtocol {
    
    var dailyPicture: AstronomyPicture { get }
    var pictures: [AstronomyPicture] { get }
    
    func getData(completion: @escaping () -> Void )
    
    func numberOfRows() -> Int
    func numberOfSections() -> Int
    func settingsButtonPressed()
    
    func cellViewModel(at indexPath: IndexPath) -> AstronomyPictureViewModelProtocol
}

class PictureListViewModel: PictureListViewModelProtocol {
    
    var dailyPicture: AstronomyPicture = AstronomyPicture(title: nil, date: nil, url: nil, hdurl: nil, medeaType: nil, explanation: nil, thumbnailUrl: nil, copyright: nil)
    var pictures: [AstronomyPicture] = []
    
    func getData(completion: @escaping () -> Void) {
        Networker.shared.fetchData { result in
            switch result {
            case .success(let AstonomyPictureObject):
                self.dailyPicture = AstonomyPictureObject as! AstronomyPicture
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        completion()
    }
    
    func cellViewModel(at indexPath: IndexPath) -> AstronomyPictureViewModelProtocol {
        let astronomyPicture = dailyPicture
        return AstronomyPictureViewModel(astronomyPicture: astronomyPicture)
    }
    
    func numberOfRows() -> Int {
        return 5
    }
    
    func numberOfSections() -> Int {
        return 2
    }
    
    func settingsButtonPressed() {
        
    }
}
