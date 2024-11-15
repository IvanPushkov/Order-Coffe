//  
//  OrderRouter.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 11.11.2024.
//

import UIKit

protocol OrderRouterProtocol : AnyObject{
    var viewController: UIViewController? { get set }
    func goToMadeOrderView()
}

final class OrderRouter: OrderRouterProtocol {
    var viewController: UIViewController?
    func goToMadeOrderView(){
        viewController?.navigationController?.pushViewController(MadeOrderBuilder.build(), animated: true)
    }
}

