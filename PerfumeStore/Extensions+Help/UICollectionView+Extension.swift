//
//  UICollectionView+Extension.swift
//  PerfumeStore
//
//  Created by Акнур on 1/25/21.
//  Copyright © 2021 Акнур. All rights reserved.
//
import UIKit

extension SearchPageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
            }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! customCell
        cell.data = data.self[indexPath.item]
        return cell
    }
    
}
