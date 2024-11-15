//  
//  LoginPresenter.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 06.11.2024.
//

import Foundation

protocol LoginPresenterProtocol : AnyObject {
    var view: LoginViewProtocol? { get set }
    var router: LoginRouterProtocol? { get set }
    var interactor: LoginInteractorProtocol? { get set }
    func configLoginView()
    func tryToLogin()
    func showResponse(response: RegistrationCondition)
    func pushToNearestCofeeView()
}

final class LoginPresenter: LoginPresenterProtocol {
    func pushToNearestCofeeView() {
        router?.goToClousestCofeeView()
    }
    
    func showResponse(response: RegistrationCondition) {
        view?.showAlertView(with: response.rawValue)
    }
    
   
    
    weak var view: LoginViewProtocol?
    var router: LoginRouterProtocol?
    var interactor: LoginInteractorProtocol?
    
    func configLoginView(){
        view?.setViewToShow()
        view?.getAccountTextField()
        view?.getPasswordTextField()
        view?.getLoginButton()
    }
    func tryToLogin() {
        let loginPasswordtext = view?.takeLoginPasswordtext()
        let logindata: [AccountData: String?] = [AccountData.login : loginPasswordtext?[0],
                                                   AccountData.password: loginPasswordtext?[1]]
        interactor?.trytologin(loginData: logindata)
    }
}


