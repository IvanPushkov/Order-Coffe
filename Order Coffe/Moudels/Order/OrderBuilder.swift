//  
//  OrderBuilder.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 11.11.2024.
//

import UIKit

final class OrderBuilder {
    
    static func build() -> UIViewController {
        let view = OrderView()
        let interactor = OrderInteractor()
        let router = OrderRouter()
        let presenter = OrderPresenter()
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
}
