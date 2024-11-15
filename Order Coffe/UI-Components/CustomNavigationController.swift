//
//  CastomNavigationController.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 29.10.2024.
//

import UIKit

class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    override func viewDidLoad() {
        delegate = self
        super.viewDidLoad()
        getNewAppereanceForNavBar()
        getNewBackButton()
    }
    
    private func getNewAppereanceForNavBar(){
        let appereance = UINavigationBarAppearance()
        appereance.configureWithOpaqueBackground()
        appereance.backgroundColor = .customWhiteNavBarColor
        appereance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customBrownTextColor, NSAttributedString.Key.font:
                                          UIFont.boldSystemFont(ofSize: 21)]
        
        navigationBar.standardAppearance = appereance
        navigationBar.scrollEdgeAppearance = appereance
    }
    private func getNewBackButton(){
        navigationBar.tintColor = .customBrownTextColor
    }
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem?.imageInsets = UIEdgeInsets(top: 55, left: 15, bottom: 15, right: 15)
       
    }
    
}
