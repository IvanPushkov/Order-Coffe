//  
//  LoginView.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 06.11.2024.
//

import Foundation
import UIKit
import SnapKit



protocol LoginViewProtocol : AnyObject {
    var presenter: LoginPresenterProtocol? { get set }
    
    func getAccountTextField()
    func getPasswordTextField()
    func getLoginButton()
    func takeLoginPasswordtext()-> [String?]
    func showAlertView(with text: String)
    func setViewToShow()
}

final class LoginView: UIViewController {
    var presenter: LoginPresenterProtocol?
    weak var nameLoginTextField: CustomTextFieldWithTitle!
    weak var passwordLoginTextField: CustomTextFieldWithTitle!
    weak var loginButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        presenter?.configLoginView()
    }
}

extension LoginView: LoginViewProtocol {
    
    
    func getAccountTextField() {
        let textField = CustomTextFieldWithTitle(title: "e-mail")
        textField.textField.delegate = self
        view.addSubview(textField)
        textField.textField.text = "Qwe@yandex.ru"  //here
        textField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.right.left.equalToSuperview().inset(18)
            make.top.equalToSuperview().inset(200)
        }
        nameLoginTextField = textField
    }
    
    func getPasswordTextField() {
        let textField = CustomTextFieldWithTitle(title: "Пароль")
        view.addSubview(textField)
        textField.textField.delegate = self
        textField.textField.text = "12345Qq"    //here
        textField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.right.left.equalToSuperview().inset(18)
            make.top.equalTo(nameLoginTextField.snp.bottom).offset(60)
        }
        passwordLoginTextField = textField
    }
    
    func getLoginButton() {
        let button = CustomButton(title: "Войти")
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(passwordLoginTextField.snp_bottomMargin).offset(60)
            make.right.left.equalToSuperview().inset(18)
        }
        button.addTarget(nil, action: #selector(tryToEnter), for: .touchUpInside)
        loginButton = button
    }
    
    @objc func tryToEnter(){
        presenter?.tryToLogin()
    }
    func takeLoginPasswordtext() -> [String?] {
        return [nameLoginTextField.textField.text, passwordLoginTextField.textField.text]
    }
    func showAlertView(with text: String) {
        DispatchQueue.main.async {
            let alert = AuthAlertController(massage: text)
            self.present(alert, animated: true)
        }
    }
    func setViewToShow(){
        title = "Вход"
        view.backgroundColor  = .white
        self.navigationItem.hidesBackButton = true
    }
    
}
extension LoginView: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

  

