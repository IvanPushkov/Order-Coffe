//  
//  RegistrationInteractor.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 29.10.2024.
//

import Foundation


protocol RegistrationInteractorProtocol : AnyObject{
    var presenter: RegistrationPresenterProtocol? { get set }
    func tryToRegister(registerData: [AccountData: String?])
}

final class RegistrationInteractor: RegistrationInteractorProtocol {
    weak var presenter: RegistrationPresenterProtocol?
    func tryToRegister(registerData: [AccountData: String?]){
        AuthManager.shared.getCondition(accountData: registerData, authOperation: .register){ [self] response in
             let condition = response
             if condition == .success{
                 presenter?.pushToLoginView()
             } else{
                 presenter?.showResponse(response: condition)
             }
         }
     }
}
