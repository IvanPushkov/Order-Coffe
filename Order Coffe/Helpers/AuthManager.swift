
import Foundation

enum RegistrationCondition: String{
    case passwordIncorect = "Пароль должен содержать минимум 6 символов, цифры, латинские буквы в большом и малом регистре!"
    case passwordRepeat = "Пароли не совпадают"
    case passwordTooShort = "Пароль слишком короткий"
    case textUnField = "Заполните все поля!"
    case success = "Все ок"
    case serverError = "Ошибка сервера"
}


enum AccountData: String{
    case login = "login"
    case password = "Password"
    case repeatedPassword = "repeatedPassword"
}



protocol RegistrationManagerProtocol{
    func getCondition(accountData: [AccountData : String?], authOperation: AuthOperation, complection: @escaping (RegistrationCondition) ->())
}

class AuthManager: RegistrationManagerProtocol{
    
    
    
    static let shared = AuthManager()
    let authService = AuthService.shared
    
    func getCondition(accountData: [AccountData : String?], authOperation: AuthOperation, complection: @escaping (RegistrationCondition) ->()) {
        let conditionBeforRequest = getConditionBeforRequest(accountData: accountData)
        if conditionBeforRequest != .success{
            complection(conditionBeforRequest)
        } else{
                getConditionAfterrequest(accountData: accountData, authOperation: authOperation) { response in
                     complection(response)
            }
        }
    }
    
    private func getConditionAfterrequest(accountData: [AccountData : String?], authOperation: AuthOperation, complection: @escaping (RegistrationCondition) ->()){
        let dataForRequest  = getDataForRequest(accountData: accountData)
        authService.tryToAuth(AccountData: dataForRequest,operationType: authOperation){ response in
            complection(response)
        }
    }
    
    private func getConditionBeforRequest(accountData: [AccountData : String?]) -> RegistrationCondition {
        if accountData.values.contains(nil){
            return RegistrationCondition.textUnField
        } else if accountData[AccountData.password]!!.count <= 6 {
            return RegistrationCondition.passwordTooShort
        } else if !passwordHasNecesseryLetters(password: accountData[AccountData.password]!!){
            return RegistrationCondition.passwordIncorect
        }
        else if accountData.count > 2  && !passwordsIsEquals(accountData: accountData){
            return RegistrationCondition.passwordRepeat
        } else {
            return RegistrationCondition.success
        }
    }
    
    private func passwordsIsEquals(accountData:[AccountData : String?]) -> Bool{
        if accountData[AccountData.password] == accountData[AccountData.repeatedPassword]{
           return true
        }
        return false
    }
    private func passwordHasNecesseryLetters(password: String) -> Bool{
        var lowLetter = false
        var heighLetter = false
        for character in password{
            if character.isUppercase{
                heighLetter = true
            } else if character.isLowercase{
                lowLetter = true
            }
        }
        if lowLetter && heighLetter{
            return true
        }
        else {
            return  false
        }
    }
   private func getDataForRequest(accountData: [AccountData : String?]) -> [String: Any]{
        var dataForRequest: [String: Any] = ["login": "", "password": ""]
        dataForRequest["login"] = accountData[.login]!
        dataForRequest["password"] = accountData[.password]!
        return dataForRequest
    }
 
}
