//
//  UITableView+Extension.swift
//  PerfumeStore
//
//  Created by Акнур on 1/25/21.
//  Copyright © 2021 Акнур. All rights reserved.
//



import UIKit

extension SearchPageViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieCellID, for: indexPath) as! PerfumeTableViewCell
        cell.getData(arrayMovies[indexPath.item]) //зачем? getData деген функцияны шакырдык, Result сакталган arrayMovies шакырамыз
       DispatchQueue.main.async {
        cell.movieImages.setImage(imgURL: "https://image.tmdb.org/t/p/w500\(self.arrayMovies[indexPath.item].backdrop_path!)")
       }
        
        return cell
    }
    
}

extension SearchPageViewController: UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMovies.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return UITableView.automaticDimension
       }
    
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let vc = LikePageViewController()
        let model = arrayMovies[indexPath.row]
           vc.titleLabel.text = model.title
           navigationController?.pushViewController(vc, animated: true)
           //print(model.backdrop_path)
       }

}
