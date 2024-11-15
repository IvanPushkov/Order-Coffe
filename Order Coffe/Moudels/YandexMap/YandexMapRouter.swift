//  
//  YandexMapRouter.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 14.11.2024.
//

import UIKit

protocol YandexMapRouterProtocol : AnyObject{
    var viewController: UIViewController? { get set }
}

final class YandexMapRouter: YandexMapRouterProtocol {
    var viewController: UIViewController?
}

