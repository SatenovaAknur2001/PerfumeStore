//
//  AppConstants.swift
//  PerfumeStore
//
//  Created by Акнур on 1/25/21.
//  Copyright © 2021 Акнур. All rights reserved.
//

import Foundation
import UIKit

struct AppConstants {
   static let movieURL : String = "https://api.themoviedb.org/3/discover/movie?api_key="
   static let key      : String = "210e2b075f370d9cf11509de665a1272"
   static let baseURL  : String = AppConstants.movieURL + AppConstants.key
}
