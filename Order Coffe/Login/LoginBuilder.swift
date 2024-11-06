//  
//  LoginBuilder.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 06.11.2024.
//

import UIKit

final class LoginBuilder {
    
    static func build() -> UIViewController {
        let view = LoginView()
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter()
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
}
