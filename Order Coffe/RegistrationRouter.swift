//  
//  RegistrationRouter.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 29.10.2024.
//

import UIKit

protocol RegistrationRouterProtocol : AnyObject{
    var viewController: UIViewController? { get set }
}

final class RegistrationRouter: RegistrationRouterProtocol {
    var viewController: UIViewController?
}

