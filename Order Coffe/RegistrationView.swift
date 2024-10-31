

import UIKit
import SnapKit

struct RegistrationViewControllerViewModel {
}


protocol RegistrationViewProtocol : AnyObject {
    var presenter: RegistrationPresenterProtocol? { get set }
    func configure(with viewModel: RegistrationViewControllerViewModel)
    func printResponse(response: String)
}


final class RegistrationView: UIViewController {
    
    var presenter: RegistrationPresenterProtocol?
    
    var nameTextField: CustomTextFieldWithTitle!
    var passwordTextField: CustomTextFieldWithTitle!
    var repeatPasswordTextField: CustomTextFieldWithTitle!
    var registrateButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Регистрация"
        nameTextField = getRegisterNameTextField()
        passwordTextField = getPassWordTextField()
        repeatPasswordTextField = getRepeatPasswordTextField()
        registrateButton = getRegistrateButton()
        view.backgroundColor  = .white
    }
    
    private func getRegisterNameTextField() -> CustomTextFieldWithTitle{
        let textField = CustomTextFieldWithTitle(title: "e-mail", placeHolderText: "example@example.ru")
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.right.left.equalToSuperview().inset(18)
        }
        return textField
    }
    private func  getPassWordTextField() -> CustomTextFieldWithTitle{
        let textField = CustomTextFieldWithTitle(title: "Пароль", placeHolderText: "*****")
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp_bottomMargin).offset(60)
            make.right.left.equalToSuperview().inset(18)
        }
        return textField
    }
    private func getRepeatPasswordTextField() -> CustomTextFieldWithTitle{
        let textField = CustomTextFieldWithTitle(title: "Повторите пароль", placeHolderText: "*****")
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp_bottomMargin).offset(60)
            make.right.left.equalToSuperview().inset(18)
        }
        return textField
    }
    private func getRegistrateButton() -> CustomButton{
        let button = CustomButton(title: "Регистрация")
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordTextField.snp_bottomMargin).offset(60)
            make.right.left.equalToSuperview().inset(18)
        }
        button.addTarget(nil, action: #selector(registrateUser), for: .touchUpInside)
        return button
    }
    @objc func registrateUser(){
        presenter?.tryToRegister(email: nameTextField.textField.text, password: passwordTextField.textField.text, repeatPassword: repeatPasswordTextField.textField.text)
    }
    
}



extension RegistrationView: RegistrationViewProtocol {
    func printResponse(response: String) {
        print(response)
    }
    
    func configure(with viewModel: RegistrationViewControllerViewModel) {
        
    }
}
