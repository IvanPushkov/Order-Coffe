//  
//  RegistrationPresenter.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 29.10.2024.
//

import Foundation


protocol RegistrationPresenterProtocol : AnyObject {
    var view: RegistrationViewProtocol? { get set }
    var router: RegistrationRouterProtocol? { get set }
    var interactor: RegistrationInteractorProtocol? { get set }
}

final class RegistrationPresenter: RegistrationPresenterProtocol {
    weak var view: RegistrationViewProtocol?
    var router: RegistrationRouterProtocol?
    var interactor: RegistrationInteractorProtocol?
}
