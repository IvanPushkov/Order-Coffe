//  
//  ClousestCofeeRouter.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 06.11.2024.
//

import UIKit

protocol ClousestCofeeRouterProtocol : AnyObject{
    var viewController: UIViewController? { get set }
    func goToOrderView()
    func goToTheMap()
}

final class ClousestCofeeRouter: ClousestCofeeRouterProtocol {
    var viewController: UIViewController?
    func goToOrderView() {
        viewController?.navigationController?.pushViewController(OrderBuilder.build(), animated: true)
    }
    func goToTheMap(){
        viewController?.navigationController?.pushViewController(YandexMapBuilder.build(), animated: true)
    }
    
}

