//
//  RegistrationService.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 05.11.2024.
//

import Foundation
import Alamofire

enum AuthOperation: String{
    case register = "register"
    case login = "login"
}

class AuthService{
    static let shared = AuthService()
    func tryToAuth(AccountData: [String: Any], operationType: AuthOperation = .register, complection: @escaping (RegistrationCondition)->RegistrationCondition) {
        DispatchQueue.main.async {
            let urlRegistration  = "http://147.78.66.203:3210/auth/" + operationType.rawValue
            let header: HTTPHeaders = ["Content-Type" :"application/json"]
            var responseFromServer: RegistrationCondition = .serverError
            AF.request(urlRegistration,method: .post, parameters: AccountData,encoding: JSONEncoding.default, headers: header)
                .response{ response in
                    debugPrint(response)
                    switch response.result{
                    case.success(_): responseFromServer = .success
                    case.failure(_): responseFromServer = .serverError
                    }
                }
            complection(responseFromServer)
        }
    }
}
