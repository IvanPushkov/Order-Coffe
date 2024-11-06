//  
//  ClousestCofeeRouter.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 06.11.2024.
//

import UIKit

protocol ClousestCofeeRouterProtocol : AnyObject{
    var viewController: UIViewController? { get set }
}

final class ClousestCofeeRouter: ClousestCofeeRouterProtocol {
    var viewController: UIViewController?
}

