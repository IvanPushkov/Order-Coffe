//  
//  RegistrationRouter.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 29.10.2024.
//

import UIKit

protocol RegistrationRouterProtocol : AnyObject{
    var viewController: UIViewController? { get set }
    func pushToLoginView()
}

final class RegistrationRouter: RegistrationRouterProtocol {
    func pushToLoginView() {
        viewController?.navigationController?.pushViewController(LoginBuilder.build(), animated: true)
    }
    
    var viewController: UIViewController?
    
}

