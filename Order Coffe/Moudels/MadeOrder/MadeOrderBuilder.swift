//  
//  MadeOrderBuilder.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 13.11.2024.
//

import UIKit

final class MadeOrderBuilder {
    
    static func build() -> UIViewController {
        let view = MadeOrderView()
        let interactor = MadeOrderInteractor()
        let router = MadeOrderRouter()
        let presenter = MadeOrderPresenter()
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
}
