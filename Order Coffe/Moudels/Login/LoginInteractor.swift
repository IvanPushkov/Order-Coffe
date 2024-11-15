//  
//  LoginInteractor.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 06.11.2024.
//

import Foundation


protocol LoginInteractorProtocol : AnyObject{
    var presenter: LoginPresenterProtocol? { get set }
    func trytologin(loginData: [AccountData: String?])
}

final class LoginInteractor: LoginInteractorProtocol {
    var loginManager = AuthManager.shared
    var serviceManager = AuthService.shared
    weak var presenter: LoginPresenterProtocol?
    func trytologin(loginData: [AccountData : String?]) {
       loginManager.getCondition(accountData: loginData, authOperation: .login){ [self] response in
            let condition = response
            if condition == .success{
                presenter?.pushToNearestCofeeView()
            } else{
                presenter?.showResponse(response: condition)
            }
        }
    }
}
