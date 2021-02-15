//
//  SearchPageViewController.swift
//  PerfumeStore
//
//  Created by Акнур on 1/23/21.
//  Copyright © 2021 Акнур. All rights reserved.
//

import UIKit
struct customData{
    var img: UIImage
}


class SearchPageViewController: UIViewController{
    
    //MARK: - Constants
    private let searchButton = UIButton(type: .system)
    private let descriptionButton = UIButton(type: .system)
    private let searchController = UISearchController(searchResultsController: nil)
    private let mainButton = UIButton(type: .system)
    private let groupButton = UIButton(type: .system)
    let movieCellID = "movieCellID"
    
    
    
    //MARK: - Variables
    var data = [
        customData(img: #imageLiteral(resourceName: "92f7642167bdb964b8cdf549e27b4121") ),
        customData(img: #imageLiteral(resourceName: "3369eea5f09ee8c7497c74caecb0f924")),
        customData(img: #imageLiteral(resourceName: "677e8a2d27665d96aa283dbe6fe19050")),
        customData(img: #imageLiteral(resourceName: "e1957ca2c3b8fb8f848a5b5b4843f742")),
        customData(img: #imageLiteral(resourceName: "083c54fac9a1d08b899f53d5200412b4")),
        customData(img: #imageLiteral(resourceName: "7995ff3ba371681d937a80534e4ff83a")),
        customData(img: #imageLiteral(resourceName: "083c54fac9a1d08b899f53d5200412b4")),
        customData(img: #imageLiteral(resourceName: "b74a60a8b16c6b23344b3b5d6832b4df") ),
        customData(img: #imageLiteral(resourceName: "083c54fac9a1d08b899f53d5200412b4")),
        customData(img: #imageLiteral(resourceName: "cf90c8dc7ad2e8298bee73a65dd105e1")),
        customData(img: #imageLiteral(resourceName: "b74a60a8b16c6b23344b3b5d6832b4df")),
        customData(img: #imageLiteral(resourceName: "92f7642167bdb964b8cdf549e27b4121")),
        customData(img: #imageLiteral(resourceName: "083c54fac9a1d08b899f53d5200412b4")),
        customData(img: #imageLiteral(resourceName: "b74a60a8b16c6b23344b3b5d6832b4df")),
    ]
    
    var arrayMovies : [Results] = [] 
    var arrMovieVM = [PerfumeViewModel]()
    var movies = [Results]()

    fileprivate let collectionView: UICollectionView = {
          var layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
           cv.translatesAutoresizingMaskIntoConstraints = false
           cv.register(customCell.self, forCellWithReuseIdentifier: "cell")
           return cv
       }()
    
    lazy var movieTableView: UITableView = {
           let tv = UITableView(frame: .zero, style: .grouped)
           return tv
       }()
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor()
        setupSubView()
        configureButton()
        setupNavigation()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           loadDataMovies()
       }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }

    //MARK: - Setup
    func setupSubView(){
        view.addSubview(searchButton)
        searchButton.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 50, left: 25, bottom: 0, right: 0))
        view.addSubview(descriptionButton)
        descriptionButton.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 90, left: 25, bottom: 0, right: 0))
        view.addSubview(mainButton)
        mainButton.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 210, left: 25, bottom: 0, right: 0))
        view.addSubview(collectionView)
        collectionView.layer.cornerRadius = 20
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .pinkColor()
        collectionView.anchor(top: mainButton.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 35, left: 15, bottom: 0, right: 15), size: .init(width: 300, height: 200))
        view.addSubview(groupButton)
        groupButton.anchor(top: collectionView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 30, left: 15, bottom: 0, right: 0))
    }
    
    func setupNavigation(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
    }
    
    private func setupTableView(){
           view.addSubview(movieTableView)
           movieTableView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 530, left: 10, bottom: 10, right: 10))
           movieTableView.delegate = self
           movieTableView.dataSource = self
           movieTableView.register(PerfumeTableViewCell.self, forCellReuseIdentifier: movieCellID)
       }
    
    //MARK: - Configuration
    func configureButton(){
        searchButton.customButton(setTitle: "Search", setTitleState: .normal, color: .black, background: .white, radius: 18, enableButton: false)
        searchButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35.0)
        
        descriptionButton.customButton(setTitle: "for perfume", setTitleState: .normal, color: .black, background: .white, radius: 10, enableButton: false)
        descriptionButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        mainButton.customButton(setTitle: "By Notes", setTitleState: .normal, color: .black, background: .white, radius: 15, enableButton: false)
        mainButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        groupButton.customButton(setTitle: "By Template", setTitleState: .normal, color: .black, background: .white, radius: 15, enableButton: false)
        groupButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
    }
    
 //MARK: - Other Functions
    func loadDataMovies() {
         MovieService.sharedInstance.getMovieData { [self] (movies) in //зачем
             self.arrayMovies = movies
             self.movieTableView.reloadData()
            
         }
     }
}

