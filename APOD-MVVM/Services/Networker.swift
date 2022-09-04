//
//  Networker.swift
//  APOD-MVVM
//
//  Created by Михаил Мезенцев on 04.09.2022.
//

import Foundation

// MARK: - Request Type Enum

enum RequestType {
    case defaultRequest
    case chosenDateRequest(date: String)
    case randomObjectsRequest(numberOfObjects: Int)
    case rangeDatesRequest(startDate: String, endDate: String)
}

class Networker {
    
    static let shared = Networker()
    
    private let query = "https://api.nasa.gov/planetary/apod?api_key=hmCWwn6l2SmCAbSzNnbeYOSQIPGZwh0CLJ1NCm1G&thumbs=true"
    
    private init() {}
    
    func fetchData(completion: @escaping (Result<Any, Error>) -> Void) {
        
        guard let url = URL(string: query) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let astronomyPictureObject = try decoder.decode(AstronomyPicture.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(astronomyPictureObject))
                }
                
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    func fetchImage(with url: String, completion: @escaping (Data) -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                completion(data)
            }
        }.resume()
    }
}
