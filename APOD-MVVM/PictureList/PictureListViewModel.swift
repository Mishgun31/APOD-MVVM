//
//  PictureListViewModel.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 01.09.2022.
//

import Foundation

protocol PictureListViewModelProtocol {
    
//    var dailyPicture: AstronomyPicture? { get }
    var pictures: [AstronomyPicture] { get }
    
    func getData(completion: @escaping () -> Void )
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> AstronomyPictureCellViewModelProtocol
    
    func settingsButtonPressed()
}

class PictureListViewModel: PictureListViewModelProtocol {
    
//    var dailyPicture: AstronomyPicture?
    var pictures: [AstronomyPicture] = []
    
    func getData(completion: @escaping () -> Void) {
        Networker.shared.fetchData { result in
            switch result {
            case .success(let astonomyPictureObject):
                guard let astronomyPicture = astonomyPictureObject as? AstronomyPicture else { return }
                self.pictures.append(astronomyPicture)
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func cellViewModel(at indexPath: IndexPath) -> AstronomyPictureCellViewModelProtocol {
        let astronomyPicture = pictures[indexPath.row]
        return AstronomyPictureCellViewModel(astronomyPicture: astronomyPicture)
    }
    
    func numberOfRows() -> Int {
        pictures.count
    }
    
    func settingsButtonPressed() {

    }
}
