//
//  AstronomyPicture.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 02.09.2022.
//

import Foundation

struct AstronomyPicture: Decodable {
    
    let title: String?
    let date: String?
    let url: String?
    let hdurl: String?
    let medeaType: String?
    let explanation: String?
    let thumbnailUrl: String?
    let copyright: String?
}
