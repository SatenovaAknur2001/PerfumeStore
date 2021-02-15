//
//  MainTabBarController.swift
//  PerfumeStore
//
//  Created by Акнур on 1/23/21.
//  Copyright © 2021 Акнур. All rights reserved.
//

import UIKit


class MainTabBarController: UITabBarController, UITabBarControllerDelegate{
    //MARK: - Constants
    let coustmeTabBarView = UIView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        configureViewControllers()
        configureView()
        modalPresentationStyle = .fullScreen
        tabBar.tintColor = .black
        addcoustmeTabBarView()
        hideTabBarBorder()
        delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        coustmeTabBarView.frame = tabBar.frame
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var newSafeArea = UIEdgeInsets()
        newSafeArea.bottom += coustmeTabBarView.bounds.size.height
        self.children.forEach({$0.additionalSafeAreaInsets = newSafeArea})
    }
    
    private func addcoustmeTabBarView() {
        coustmeTabBarView.frame = tabBar.frame
        view.addSubview(coustmeTabBarView)
        view.bringSubviewToFront(self.tabBar)
    }
    
    
    func hideTabBarBorder()  {
        let tabBar = self.tabBar
        tabBar.backgroundImage = UIImage.from(color: .clear)
        tabBar.shadowImage = UIImage()
        tabBar.clipsToBounds = true
        
    }
    //MARK: - Configure
    
    func configureView(){
        coustmeTabBarView.customeTabBar(masks: false, opacity: 0.12, shadowColor: UIColor.black, shadowRadius: 10.0, colors: UIColor.white, rd: 10, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMinYCorner], clipsBounds: true, offset: CGSize.init(width: 0, height: -8))
    }
    func configureViewControllers() {
        let item = templateNavController(rootViewController: MainShopPageViewController(), image: #imageLiteral(resourceName: "icons8-home-24"))
        let second = templateNavController(rootViewController: SearchPageViewController(), image: #imageLiteral(resourceName: "icons8-search-24"))
        let middle = templateNavController(rootViewController: LikePageViewController(), image: #imageLiteral(resourceName: "icons8-heart-24"))
        let third = templateNavController(rootViewController: ProfilePageViewController(), image: #imageLiteral(resourceName: "icons8-person-24"))
        
        viewControllers = [item, second, middle, third]
        
    }
    
}
//MARK: - Functions

func templateNavController(rootViewController: UIViewController, image: UIImage) -> UINavigationController{
    let navController = UINavigationController(rootViewController: rootViewController)
    navController.tabBarItem.image = image
    return navController
}
func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    return true
}



