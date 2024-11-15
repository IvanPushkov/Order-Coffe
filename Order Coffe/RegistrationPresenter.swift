
import Foundation

protocol RegistrationPresenterProtocol : AnyObject {
    var view: RegistrationViewProtocol? { get set }
    var router: RegistrationRouterProtocol? { get set }
    var interactor: RegistrationInteractorProtocol? { get set }
    func configRegisterView()
    func tryToRegister()
    func showResponse(response: RegistrationCondition)
    func pushToLoginView()
}

final class RegistrationPresenter: RegistrationPresenterProtocol {
    func configRegisterView() {
        view?.setViewToShow()
        view?.getRegisterNameTextField()
        view?.getPassWordTextField()
        view?.getRepeatPasswordTextField()
        view?.getRegistrateButton()
    }
    
    weak var view: RegistrationViewProtocol?
    var router: RegistrationRouterProtocol?
    var interactor: RegistrationInteractorProtocol?
    
    func tryToRegister() {
        let textFromView = view?.getLoginPasswordRepiatPaswordText()
        let registerData:[AccountData: String?] = [AccountData.login : textFromView?[0],
                                                   AccountData.password: textFromView?[1],
                                                   AccountData.repeatedPassword: textFromView?[2]]
        interactor?.tryToRegister(registerData:registerData)
    }
    
    func showResponse(response: RegistrationCondition) {
        view?.showAlertView(with: response.rawValue)
    }
    
    func pushToLoginView(){
        router?.pushToLoginView()
    }
}
