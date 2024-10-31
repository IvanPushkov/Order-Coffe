//  
//  RegistrationInteractor.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 29.10.2024.
//

import Foundation


protocol RegistrationInteractorProtocol : AnyObject{
    var presenter: RegistrationPresenterProtocol? { get set }
    func tryToRegister(email: String?, password: String?, repeatPassword: String?)
}

final class RegistrationInteractor: RegistrationInteractorProtocol {
    weak var presenter: RegistrationPresenterProtocol?
    func tryToRegister(email: String?, password: String?, repeatPassword: String?){
        let passwordAndEmailArray = [email, password, repeatPassword]
        
        switch true{
        case password != repeatPassword:  presenter?.takeResponse(response: .passwordIncorect)
        case passwordAndEmailArray.contains(where: {$0 == nil}): presenter?.takeResponse(response: .textUnField)
        case (email?.contains("@") == false):
            presenter?.takeResponse(response: .serverError)
        case false:
            presenter?.takeResponse(response: .success)
        default: break
        }
    }
}
