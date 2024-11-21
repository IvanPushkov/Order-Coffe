//
//  LocationAlertController.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 20.11.2024.
//

import UIKit

class LocationAlertController: UIAlertController {
    var settingButton: UIAlertAction! = nil
    override func viewDidLoad() {
        self.addAction(cancelButton)
        self.addAction(settingButton)
    }
    convenience init(titleAlert: String, message: String , url: String) {
        self.init (title: titleAlert, message: message, preferredStyle: .alert)
        settingButton = UIAlertAction(title: "Настройки", style: .default){_ in
            if let url = URL(string: url){
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    
   
    let cancelButton = UIAlertAction(title: "Отмена", style: .cancel)
    
}
