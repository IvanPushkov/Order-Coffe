//  
//  RegistrationBuilder.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 29.10.2024.
//

import UIKit

final class RegistrationBuilder {
    
    static func build() -> UIViewController {
        let view = RegistrationView()
        let interactor = RegistrationInteractor()
        let router = RegistrationRouter()
        let presenter = RegistrationPresenter()
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
}
