

import UIKit
import SnapKit




protocol RegistrationViewProtocol : AnyObject {
    var presenter: RegistrationPresenterProtocol? { get set }
    
    func registerButtonAction(response: String)
    func getRegisterNameTextField()
    func getPassWordTextField()
    func getRepeatPasswordTextField()
    func getRegistrateButton()
    func getLoginPasswordRepiatPaswordText() -> [String?]
    func showAlertView(with text: String)
}


final class RegistrationView: UIViewController {
    var presenter: RegistrationPresenterProtocol?
    
    weak var nameTextField: CustomTextFieldWithTitle!
    weak var passwordTextField: CustomTextFieldWithTitle!
    weak var repeatPasswordTextField: CustomTextFieldWithTitle!
    weak var registrateButton: CustomButton!
}

extension RegistrationView: RegistrationViewProtocol  {
    
    
   
    //MARK: - Configuration View
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Регистрация"
        view.backgroundColor  = .white
        presenter?.configRegisterView()
    }
    func getRegisterNameTextField() {
        let textField = CustomTextFieldWithTitle(title: "e-mail", placeHolderText: "example@example.ru")
        view.addSubview(textField)
        textField.textField.delegate = self
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.right.left.equalToSuperview().inset(18)
        }
        nameTextField = textField
    }
    func  getPassWordTextField() {
        let  textField = CustomTextFieldWithTitle(title: "Пароль")
        view.addSubview(textField)
        textField.textField.delegate = self
        textField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp_bottomMargin).offset(60)
            make.right.left.equalToSuperview().inset(18)
        }
        passwordTextField = textField
    }
    func getRepeatPasswordTextField() {
        let  textField = CustomTextFieldWithTitle(title: "Повторите пароль")
        textField.textField.delegate = self
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp_bottomMargin).offset(60)
            make.right.left.equalToSuperview().inset(18)
        }
        repeatPasswordTextField = textField
    }
    
    func getRegistrateButton() {
        let button = CustomButton(title: "Регистрация")
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordTextField.snp_bottomMargin).offset(60)
            make.right.left.equalToSuperview().inset(18)
        }
        button.addTarget(nil, action: #selector(registrateUser), for: .touchUpInside)
        registrateButton = button
    }
 //MARK: - Action View
    func getLoginPasswordRepiatPaswordText() -> [String?] {
        return [nameTextField.textField.text, passwordTextField.textField.text, repeatPasswordTextField.textField.text]
    }
    @objc func registrateUser(){
        presenter?.tryToRegister()
    }

    func registerButtonAction(response: String) {
        print(response)
    }
    func showAlertView(with text: String) {
        DispatchQueue.main.async {
            let alert = AuthAlertController(massage: text)
            self.present(alert, animated: true)
        }
    }
}

extension RegistrationView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()  
           return true
       }
}
