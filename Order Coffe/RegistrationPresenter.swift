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
    func tryToRegister(email: String?, password: String?, repeatPassword: String?)
    func takeResponse(response: RegistrationResponse)
}

final class RegistrationPresenter: RegistrationPresenterProtocol {
  
    weak var view: RegistrationViewProtocol?
    var router: RegistrationRouterProtocol?
    var interactor: RegistrationInteractorProtocol?
    func tryToRegister(email: String?, password: String?, repeatPassword: String?) {
        interactor?.tryToRegister(email: email, password: password, repeatPassword: repeatPassword)
    }
    
    func takeResponse(response: RegistrationResponse) {
        switch response{
            
        case .passwordIncorect:
            view?.printResponse(response: "Неправильный пароль")
        case .textUnField:
            view?.printResponse(response: "Пустые поля")
        case .success:
            view?.printResponse(response: "Супер")
        case .serverError:
            view?.printResponse(response: "Ошибка сервера")
        }
        
    }
    
}
