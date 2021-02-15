//
//  NetworkingService.swift
//  PerfumeStore
//
//  Created by Акнур on 1/23/21.
//  Copyright © 2021 Акнур. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkingService {
    func getMovieData(completationHandler: @escaping(_ movieData: [Results]) -> ())
}

final class MovieService: NetworkingService {
    
    static let sharedInstance = MovieService()
    
    func getMovieData(completationHandler: @escaping ([Results]) -> ()) {
        
        AF.request(AppConstants.baseURL,method: .get).response {
            result in
            switch result.result {
                case .success(let data):
                    do {
                        let movieResult = try JSONDecoder().decode(Movie.self, from: data!)
                        var array = [Results]()
                        DispatchQueue.main.async {
                            array.append(contentsOf: movieResult.results!)
                            completationHandler(array)
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
            }
        }.resume()
    }
}

