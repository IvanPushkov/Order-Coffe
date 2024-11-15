//  
//  YandexMapPresenter.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 14.11.2024.
//

import Foundation

protocol YandexMapPresenterProtocol : AnyObject {
    var view: YandexMapViewProtocol? { get set }
    var router: YandexMapRouterProtocol? { get set }
    var interactor: YandexMapInteractorProtocol? { get set }
}

final class YandexMapPresenter: YandexMapPresenterProtocol {
    weak var view: YandexMapViewProtocol?
    var router: YandexMapRouterProtocol?
    var interactor: YandexMapInteractorProtocol?
}
