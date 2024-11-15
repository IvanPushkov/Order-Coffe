//  
//  YandexMapInteractor.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 14.11.2024.
//

import Foundation


protocol YandexMapInteractorProtocol : AnyObject{
    var presenter: YandexMapPresenterProtocol? { get set }
}

final class YandexMapInteractor: YandexMapInteractorProtocol {
    weak var presenter: YandexMapPresenterProtocol?
}
