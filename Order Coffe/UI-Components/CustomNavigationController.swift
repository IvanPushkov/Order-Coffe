//
//  CastomNavigationController.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 29.10.2024.
//

import UIKit

class CustomNavigationController: UINavigationController {   
    override func viewDidLoad() {
        super.viewDidLoad()
        getNewAppereanceForNavBar()
        getNewBackButton()
    }
    
    private func getNewAppereanceForNavBar(){
        let appereance = UINavigationBarAppearance()
        appereance.configureWithOpaqueBackground()
        appereance.backgroundColor = .customWhiteNavBarColor
        appereance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customBrownTextColor]
        navigationBar.standardAppearance = appereance
        navigationBar.scrollEdgeAppearance = appereance
    }
    private func getNewBackButton(){
        navigationBar.tintColor = .customBrownTextColor
        
    }
    
}
