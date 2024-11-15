//  
//  MadeOrderRouter.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 13.11.2024.
//

import UIKit

protocol MadeOrderRouterProtocol : AnyObject{
    var viewController: UIViewController? { get set }
}

final class MadeOrderRouter: MadeOrderRouterProtocol {
    var viewController: UIViewController?
}

