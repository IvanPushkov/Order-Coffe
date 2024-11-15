//  
//  YandexMapBuilder.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 14.11.2024.
//

import UIKit

final class YandexMapBuilder {
    
    static func build() -> UIViewController {
        let view = YandexMapView()
        let interactor = YandexMapInteractor()
        let router = YandexMapRouter()
        let presenter = YandexMapPresenter()
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
}
