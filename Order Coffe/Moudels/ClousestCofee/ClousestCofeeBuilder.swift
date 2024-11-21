//  
//  ClousestCofeeBuilder.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 06.11.2024.
//

import UIKit

final class ClousestCofeeBuilder {
    
    static func build() -> UIViewController {
        let view = ClousestCofeeView()
        let interactor = ClousestCofeeInteractor()
        let router = ClousestCofeeRouter()
        let presenter = ClousestCofeePresenter()
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        router.viewController = view
        return view
    }
}
