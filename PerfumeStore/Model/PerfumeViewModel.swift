//
//  PerfumeViewModel.swift
//  PerfumeStore
//
//  Created by Акнур on 1/25/21.
//  Copyright © 2021 Акнур. All rights reserved.
//

import Foundation

class PerfumeViewModel{
    let title: String?
    
    init(movie: Results) {
        self.title = movie.title
    }
}
